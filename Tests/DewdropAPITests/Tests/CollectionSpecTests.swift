// Copyright © Fleuronic LLC. All rights reserved.

import Testing

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropAPI.API

struct CollectionSpecTests {
	@Test func fetchCollectionID() async throws {
		let api = API.mock.specifyingCollectionFields(Collection.IDFields.self)
		api.mockFetchCollection(byReturning: .model(.collection(.root)))

		let id: Collection.ID = 456
		let collection = try await api.fetchCollection(with: id).resource
		#expect(collection.id == id)
	}

	@Test func fetchCollectionDetails() async throws {
		let api = API.mock
		api.mockFetchCollection(byReturning: .model(.collection(.root)))

		let id: Collection.ID = 456
		let ownerID: User.ID = 789
		let details = try await api.fetchCollection(with: id).resource
		let collection = Collection(
			title: "Websites",
			count: 36,
			coverURL: .init(string: "https://www.websites.com/cover.jpg"),
			colorString: "abcdef",
			view: .masonry,
			access: .init(level: .owner, isDraggable: true),
			sortIndex: 3,
			isPublic: true,
			isShared: true,
			isExpanded: true,
			creationDate: .distantPast,
			updateDate: .distantPast
		)

		#expect(details.id == id)
		#expect(details.title == collection.title)
		#expect(details.count == collection.count)
		#expect(details.coverURL == collection.coverURL)
		#expect(details.colorString == collection.colorString)
		#expect(details.view == collection.view)
		#expect(details.access == collection.access)
		#expect(details.sortIndex == collection.sortIndex)
		#expect(details.isPublic == collection.isPublic)
		#expect(details.isShared == collection.isShared)
		#expect(details.isExpanded == collection.isExpanded)
		#expect(details.creationDate == collection.creationDate)
		#expect(details.updateDate == collection.updateDate)
		#expect(details.owner.id == ownerID)
		#expect(details.parent == nil)
	}

	@Test func fetchInvalidCollection() async throws {
		let api = API.mock
		api.mockFetchCollection(byReturning: .error(.notFound))

		do {
			let id: Collection.ID = 654
			try await api.fetchCollection(with: id).validate()
		} catch let .api(error) {
			#expect(error.statusCode == 404)
			#expect(error.message == "Not found")
		}
	}

	@Test func listSystemCollections() async throws {
		let api = API.mock
		api.mockListSystemCollections(byReturning: .list(.collection(.system)))

		let list = try await api.listSystemCollections().resource
		let ids: [Collection.ID] = [.all, .unsorted, .trash]
		let counts = [500, 7, 3]
		#expect(list.map(\.id) == ids)
		#expect(list.map(\.count) == counts)
	}

	@Test func listRootCollections() async throws {
		let api = API.mock
		api.mockListRootCollections(byReturning: .list(.collection(.root)))

		let ids: [Collection.ID] = [1, 2]
		let ownerID: User.ID = 789
		let list = try await api.listRootCollections().resource
		let collections = ids.map { id in
			Collection(
				title: "Websites \(id)",
				count: 36,
				coverURL: .init(string: "https://www.websites\(id).com/cover.jpg"),
				colorString: "abcdef",
				view: .masonry,
				access: .init(level: .owner, isDraggable: true),
				sortIndex: 3,
				isPublic: true,
				isShared: true,
				isExpanded: true,
				creationDate: .distantPast,
				updateDate: .distantPast
			)
		}

		#expect(list.map(\.id) == ids)
		#expect(list.map(\.title) == collections.map(\.title))
		#expect(list.map(\.count) == collections.map(\.count))
		#expect(list.map(\.coverURL) == collections.map(\.coverURL))
		#expect(list.map(\.colorString) == collections.map(\.colorString))
		#expect(list.map(\.view) == collections.map(\.view))
		#expect(list.map(\.access) == collections.map(\.access))
		#expect(list.map(\.sortIndex) == collections.map(\.sortIndex))
		#expect(list.map(\.isPublic) == collections.map(\.isPublic))
		#expect(list.map(\.isShared) == collections.map(\.isShared))
		#expect(list.map(\.isExpanded) == collections.map(\.isExpanded))
		#expect(list.map(\.creationDate) == collections.map(\.creationDate))
		#expect(list.map(\.updateDate) == collections.map(\.updateDate))
		#expect(list.map(\.owner.id).allSatisfy { $0 == ownerID })
		#expect(list.map(\.parent).allSatisfy { $0 == nil })
	}

	@Test func listChildCollections() async throws {
		let api = API.mock
		api.mockListChildCollections(byReturning: .list(.collection(.child)))

		let ids: [Collection.ID] = [11, 21]
		let parentIDs: [Collection.ID] = [1, 2]
		let ownerID: User.ID = 789
		let list = try await api.listChildCollections().resource
		let collections = parentIDs.map { id in
			Collection(
				title: "Blogs \(id)",
				count: 36,
				coverURL: .init(string: "https://www.blogs\(id).com/cover.jpg"),
				colorString: "abcdef",
				view: .masonry,
				access: .init(level: .owner, isDraggable: true),
				sortIndex: 3,
				isPublic: true,
				isShared: true,
				isExpanded: true,
				creationDate: .distantPast,
				updateDate: .distantPast
			)
		}

		#expect(list.map(\.id) == ids)
		#expect(list.map(\.title) == collections.map(\.title))
		#expect(list.map(\.count) == collections.map(\.count))
		#expect(list.map(\.coverURL) == collections.map(\.coverURL))
		#expect(list.map(\.colorString) == collections.map(\.colorString))
		#expect(list.map(\.view) == collections.map(\.view))
		#expect(list.map(\.access) == collections.map(\.access))
		#expect(list.map(\.sortIndex) == collections.map(\.sortIndex))
		#expect(list.map(\.isPublic) == collections.map(\.isPublic))
		#expect(list.map(\.isShared) == collections.map(\.isShared))
		#expect(list.map(\.isExpanded) == collections.map(\.isExpanded))
		#expect(list.map(\.creationDate) == collections.map(\.creationDate))
		#expect(list.map(\.updateDate) == collections.map(\.updateDate))
		#expect(list.map(\.owner.id).allSatisfy { $0 == ownerID })
		#expect(list.map(\.parent?.id) == parentIDs)
	}

	@Test func listCovers() async throws {
		let api = API.mock
		api.mockListCovers(byReturning: .list(.cover))

		let list = try await api.listCovers(searchingFor: "Cover").resource
		let covers = [1, 2].map { index in
			Collection.Cover(
				title: "Cover \(index)",
				icons: [
					.init(png: .init(string: "https://www.website\(index).com/icon1.png")!),
					.init(png: .init(string: "https://www.website\(index).com/icon2.png")!)
				]
			)
		}

		#expect(list.map(\.title) == covers.map(\.title))
		#expect(list.map(\.icons) == covers.map(\.icons))
	}

	@Test func listFeaturedCovers() async throws {
		let api = API.mock
		api.mockListFeaturedCovers(byReturning: .list(.cover))

		let list = try await api.listFeaturedCovers().resource
		let covers = [1, 2].map { index in
			Collection.Cover(
				title: "Cover \(index)",
				icons: [
					.init(png: .init(string: "https://www.website\(index).com/icon1.png")!),
					.init(png: .init(string: "https://www.website\(index).com/icon2.png")!)
				]
			)
		}

		#expect(list.map(\.title) == covers.map(\.title))
		#expect(list.map(\.icons) == covers.map(\.icons))
	}

	@Test func expandCollections() async throws {
		let api = API.mock
		api.mockExpandCollections(byReturning: .success)

		let success = try await api.expandCollections(true).resource
		#expect(success)
	}

	@Test func sortCollections() async throws {
		let api = API.mock
		api.mockSortCollections(byReturning: .success)

		let success = try await api.sortCollections(by: .title()).resource
		#expect(success)
	}

	@Test func mergeCollections() async throws {
		let api = API.mock
		api.mockMergeCollections(byReturning: .merge)

		let id: Collection.ID = 2
		let ids: [Collection.ID] = [1, 2]
		let merge = try await api.mergeCollections(with: ids, intoCollectionWith: id).resource
		#expect(merge.ids == [id])
		#expect(merge.count == 1)
	}

	@Test func removeCollection() async throws {
		let api = API.mock
		api.mockRemoveCollection(byReturning: .success)

		let id: Collection.ID = 456
		let success = try await api.removeCollection(with: id).resource
		#expect(success)
	}

	@Test func removeCollections() async throws {
		let api = API.mock
		api.mockRemoveCollections(byReturning: .removal)

		let ids: [Collection.ID] = [1, 2]
		let removal = try await api.removeCollections(with: ids).resource
		#expect(removal.ids == ids)
		#expect(removal.count == 2)
	}

	@Test func removeEmptyCollections() async throws {
		let api = API.mock
		api.mockRemoveEmptyCollections(byReturning: .count)

		let removal = try await api.removeEmptyCollections().resource
		#expect(removal.count == 3)
	}

	@Test func emptyTrash() async throws {
		let api = API.mock
		api.mockRemoveCollection(byReturning: .success)

		let success = try await api.emptyTrash().resource
		#expect(success)
	}
}
