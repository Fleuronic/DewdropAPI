// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropRESTAPI.CollectionCountFields
import struct DewdropRESTAPI.CollectionModificationFields
import struct DewdropRESTAPI.EmptyCollectionRemovalFields
import struct Catena.IDFields
import struct Foundation.URL
import struct Identity.Identifier
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	#if swift(<6.0)
	public typealias CollectionFetchFields = CollectionSpecifiedFields
	public typealias RootCollectionListFields = CollectionSpecifiedFields
	public typealias ChildCollectionListFields = CollectionSpecifiedFields
	public typealias SystemCollectionListFields = CollectionCountFields
	public typealias CollectionCreationFields = CollectionSpecifiedFields
	#endif

	public func fetchCollection(with id: Collection.ID) async -> SingleResult<CollectionSpecifiedFields> {
		await result {
			try await collectionEndpoints.getCollection(id: id).item
		}
	}

	public func listRootCollections() async -> Results<CollectionSpecifiedFields> {
		await results {
			try await collectionEndpoints.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Results<CollectionSpecifiedFields> {
		await results {
			try await collectionEndpoints.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Results<CollectionCountFields> {
		await results {
			try await userEndpoints.getSystemCollectionsCount().items
		}
	}

	public func listCovers(searchingFor query: String) async -> Results<Collection.Cover> {
		await result {
			try await collectionEndpoints.searchForCover(text: query).items
		}
	}

	public func listFeaturedCovers() async -> Results<Collection.Cover> {
		await result {
			try await collectionEndpoints.featuredCovers().items
		}
	}

	public func createCollection(_ id: Collection.PendingID = .fromServer, titled title: String, with parameters: Collection.Parameters = .init()) async -> SingleResult<CollectionSpecifiedFields> {
		await result {
			try await collectionEndpoints.createCollection(
				title: title,
				cover: parameters.coverURL.map { [$0] },
				view: parameters.view,
				sort: parameters.sortIndex,
				public: parameters.public,
				parent: parameters.parentID.map(Collection.Parent.init)
			).item
		}
	}

	public func updateCollection(with id: Collection.ID, toTitle title: String? = nil, expanding: Bool? = nil, updating parameters: Collection.Parameters = .init()) async -> SingleResult<CollectionSpecifiedFields> {
		await result {
			try await collectionEndpoints.updateCollection(
				id: id,
				title: title,
				cover: parameters.coverURL.map { [$0] },
				view: parameters.view,
				sort: parameters.sortIndex,
				public: parameters.public,
				expanded: expanding,
				parent: parameters.parentID.map(Collection.Parent.init)
			).item
		}
	}

	public func uploadCover(forCollectionWith id: Collection.ID, usingFileAt url: URL) async -> SingleResult<CollectionSpecifiedFields> {
		await result {
			try await collectionEndpoints.uploadCover(
				id: id,
				cover: .init(
					data: .init(contentsOf: url),
					fileName: "cover"
				)
			).item
		}
	}

	public func expandCollections(_ expanded: Bool) async -> SuccessResult {
		await result {
			try await collectionEndpoints.expandCollapseCollections(expanded: expanded).result
		}
	}

	public func sortCollections(by sort: Collection.Sort) async -> SuccessResult {
		await result {
			try await collectionEndpoints.reorderCollections(sort: sort).result
		}
	}

	public func mergeCollections(with ids: [Collection.ID], intoCollectionWith id: Collection.ID) async -> SingleResult<CollectionModificationFields> {
		await result {
			try await collectionEndpoints.mergeCollections(
				to: id,
				ids: ids
			)
		}
	}

	public func removeCollection(with id: Collection.ID) async -> SuccessResult {
		await result {
			try await collectionEndpoints.removeCollection(id: id).result
		}
	}

	public func removeCollections(with ids: [Collection.ID]) async -> SingleResult<CollectionModificationFields> {
		await result {
			try await collectionEndpoints.removeMultipleCollections(ids: ids)
		}
	}

	public func removeEmptyCollections() async -> SingleResult<EmptyCollectionRemovalFields> {
		await result {
			try await collectionEndpoints.removeAllEmptyCollections()
		}
	}

	public func emptyTrash() async -> SuccessResult {
		await removeCollection(with: .trash)
	}
}
