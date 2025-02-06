// Copyright © Fleuronic LLC. All rights reserved.

import Testing

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.User
import struct Dewdrop.Highlight
import struct Dewdrop.Tag
import struct DewdropAPI.API
import struct Foundation.URL

struct RaindropSpecTests {
	@Test func fetchRaindropID() async throws {
		let api = API.mock.specifyingRaindropFields(Raindrop.IDFields.self)
		api.mockFetchRaindrop(byReturning: .model(.raindrop))
		
		let id: Raindrop.ID = 123
		let raindrop = try await api.fetchRaindrop(with: id).resource
		#expect(raindrop.id == id)
	}

	@Test func fetchRaindropDetails() async throws {
		let api = API.mock
		api.mockFetchRaindrop(byReturning: .model(.raindrop))
		
		let id: Raindrop.ID = 123
		let collectionID: Collection.ID = 456
		let ownerID: User.ID = 789
		let details = try await api.fetchRaindrop(with: id).resource
		let raindrop = Raindrop(
			url: .init(string: "https://www.website.com")!,
			domain: "website.com",
			title: "Website",
			itemType: .link,
			excerpt: "Excerpt from this website.",
			coverURL: .init(string: "https://www.website.com/cover.jpg"),
			note: "Note for this raindrop.",
			media: [
				.init(
					url: .init(string: "https://www.website.com/hero.jpg")!,
					type: .image
				),
				.init(
					url: .init(string: "https://www.website.com/background.jpg")!,
					type: .image
				)
			],
			cache: .init(
				status: .ready,
				size: 256,
				creationDate: .distantPast
			),
			reminder: .init(date: .distantFuture),
			isFavorite: true,
			isBroken: true,
			creationDate: .distantPast,
			updateDate: .distantPast
		)

		let creatorID = ownerID
		let creator = User(
			username: "jordanekay",
			fullName: "Jordan Kay",
			avatarURL: URL(string: "https://raindrop.io/avatars/jordan.jpeg"),
			hasProSubscription: true
		)
		
		let tagNames = ["website"]
		let highlights = [
			Highlight(
				text: "highlighted text",
				color: .green,
				note: "The note for the highlight.",
				title: "Website",
				creationDate: .distantPast,
				updateDate: .distantPast
			)
		]

		#expect(details.id == id)
		#expect(details.url == raindrop.url)
		#expect(details.domain == raindrop.domain)
		#expect(details.title == raindrop.title)
		#expect(details.itemType == raindrop.itemType)
		#expect(details.excerpt == raindrop.excerpt)
		#expect(details.coverURL == raindrop.coverURL)
		#expect(details.note == raindrop.note)
		#expect(details.media == raindrop.media)
		#expect(details.cache == raindrop.cache)
		#expect(details.reminder == raindrop.reminder)
		#expect(details.isFavorite == raindrop.isFavorite)
		#expect(details.isBroken == raindrop.isBroken)
		#expect(details.creationDate == raindrop.creationDate)
		#expect(details.updateDate == raindrop.updateDate)
		#expect(details.collection.id == collectionID)
		#expect(details.owner.id == ownerID)
		#expect(details.creator.username == creator.username)
		#expect(details.creator.avatarURL == creator.avatarURL)
		#expect(details.tags.map(\.name) == tagNames)
		#expect(details.highlights.map(\.text) == highlights.map(\.text))
		#expect(details.highlights.map(\.color) == highlights.map(\.color))
		#expect(details.highlights.map(\.note) == highlights.map(\.note))
		#expect(details.highlights.map(\.title) == highlights.map(\.title))
		#expect(details.highlights.map(\.creationDate) == highlights.map(\.creationDate))
		#expect(details.highlights.map(\.updateDate) == highlights.map(\.updateDate))
		#expect(details.highlights.map(\.creator.id).allSatisfy { $0 == creatorID })
		#expect(details.highlights.map(\.creator.username).allSatisfy { $0 == creator.username })
		#expect(details.highlights.map(\.creator.avatarURL).allSatisfy { $0 == creator.avatarURL })
	}
	
	@Test func listRaindrops() async throws {
		let api = API.mock
		api.mockListRaindrops(byReturning: .list(.raindrop))

		let ids: [Raindrop.ID] = [1, 2]
		let collectionID: Collection.ID = 456
		let ownerID: User.ID = 789
		let list = try await api.listRaindrops().resource
		let raindrops = ids.map { id in
			Raindrop(
				url: .init(string: "https://www.website\(id).com")!,
				domain: "website\(id).com",
				title: "Website \(id)",
				itemType: .link,
				excerpt: "Excerpt from website \(id).",
				coverURL: .init(string: "https://www.website\(id).com/cover.jpg"),
				note: "Note for raindrop \(id).",
				media: [
					.init(
						url: .init(string: "https://www.website\(id).com/hero.jpg")!,
						type: .image
					),
					.init(
						url: .init(string: "https://www.website\(id).com/background.jpg")!,
						type: .image
					)
				],
				cache: .init(
					status: .ready,
					size: 256,
					creationDate: .distantPast
				),
				reminder: .init(date: .distantFuture),
				isFavorite: true,
				isBroken: true,
				creationDate: .distantPast,
				updateDate: .distantPast
			)
		}

		let creatorID = ownerID
		let creator = User(
			username: "jordanekay",
			fullName: "Jordan Kay",
			avatarURL: URL(string: "https://raindrop.io/avatars/jordan.jpeg"),
			hasProSubscription: true
		)
		
		let tagNames = ["website"]
		let highlightColors: [Highlight.Color] = [.red, .blue]
		let highlights = ids.enumerated().map { index, id in
			[
				Highlight(
					text: "highlighted text",
					color: highlightColors[index],
					note: "The note for the highlight.",
					title: "Website \(id)",
					creationDate: .distantPast,
					updateDate: .distantPast
				)
			]
		}

		#expect(list.map(\.id) == ids)
		#expect(list.map(\.url) == raindrops.map(\.url))
		#expect(list.map(\.domain) == raindrops.map(\.domain))
		#expect(list.map(\.title) == raindrops.map(\.title))
		#expect(list.map(\.itemType) == raindrops.map(\.itemType))
		#expect(list.map(\.excerpt) == raindrops.map(\.excerpt))
		#expect(list.map(\.coverURL) == raindrops.map(\.coverURL))
		#expect(list.map(\.note) == raindrops.map(\.note))
		#expect(list.map(\.media) == raindrops.map(\.media))
		#expect(list.map(\.cache) == raindrops.map(\.cache))
		#expect(list.map(\.reminder) == raindrops.map(\.reminder))
		#expect(list.map(\.isFavorite) == raindrops.map(\.isFavorite))
		#expect(list.map(\.isBroken) == raindrops.map(\.isBroken))
		#expect(list.map(\.creationDate) == raindrops.map(\.creationDate))
		#expect(list.map(\.updateDate) == raindrops.map(\.updateDate))
		#expect(list.map(\.collection.id).allSatisfy { $0 == collectionID })
		#expect(list.map(\.owner.id).allSatisfy { $0 == ownerID})
		#expect(list.map(\.creator.id).allSatisfy { $0 == creatorID})
		#expect(list.map(\.creator.username).allSatisfy { $0 == creator.username})
		#expect(list.map(\.creator.avatarURL).allSatisfy { $0 == creator.avatarURL})
		#expect(list.map { $0.tags.map(\.name) }.allSatisfy { $0 == tagNames })
		#expect(list.map { $0.highlights.map(\.text) } == highlights.map { $0.map(\.text) })
		#expect(list.map { $0.highlights.map(\.color) } == highlights.map { $0.map(\.color) })
		#expect(list.map { $0.highlights.map(\.note) } == highlights.map { $0.map(\.note) })
		#expect(list.map { $0.highlights.map(\.title) } == highlights.map { $0.map(\.title) })
		#expect(list.map { $0.highlights.map(\.creationDate) } == highlights.map { $0.map(\.creationDate) })
		#expect(list.map { $0.highlights.map(\.updateDate) } == highlights.map { $0.map(\.updateDate) })
		#expect(list.map { $0.highlights.map(\.creator.id) }.allSatisfy { $0 == [creatorID] })
	}

	@Test func fetchInvalidRaindrop() async throws {
		let api = API.mock
		api.mockFetchRaindrop(byReturning: .error(.notFound))
		
		do {
			let id: Raindrop.ID = 321
			try await api.fetchRaindrop(with: id).validate()
		} catch let .api(error) {
			#expect(error.statusCode == 404)
			#expect(error.message == "Not found")
		}
	}
}
