// Copyright © Fleuronic LLC. All rights reserved.

import Testing

import struct Dewdrop.Raindrop
import struct DewdropAPI.API
import struct Foundation.URL

struct RaindropSpecTests {
	@Test func fetchRaindropID() async throws {
		let api = API.mock.specifyingRaindropFields(Raindrop.IDFields.self)
		api.mockFetchRaindrop()
		
		let raindrop = try await api.fetchRaindrop(with: .valid).resource
		#expect(raindrop.id == .valid)
	}

	@Test func fetchRaindropDetails() async throws {
		let api = API.mock
		api.mockFetchRaindrop()
		
		let details = try await api.fetchRaindrop(with: .valid).resource
		let raindrop = Raindrop.init(
			url: .init(string: "https://www.website.com")!,
			domain: "website.com",
			info: .init(
				title: "Website",
				itemType: .link,
				excerpt: "Excerpt from this website.",
				coverURL: .init(string: "https://www.website.com/cover.jpg")
			),
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
			reminder: nil,
			isFavorite: false,
			isBroken: false,
			creationDate: .distantPast,
			updateDate: .distantPast
		)
		
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
	}

	@Test func fetchInvalidRaindrop() async throws {
		let api = API.mock
		api.mockFetchRaindrop()
		
		do {
			try await api.fetchRaindrop(with: .invalid).validate()
		} catch let .api(error) {
			#expect(error.statusCode == 404)
			#expect(error.message == "Not found")
		}
	}
}
