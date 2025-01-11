// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.Media
import struct Dewdrop.Highlight
import struct Foundation.Data
import protocol DewdropService.RaindropFields

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints {
	@GET("/raindrop/{id}")
	func getRaindrop<Fields>(id: Raindrop.ID) async throws -> RaindropResponse<Fields>

	@GET("/raindrop/{id}")
	func getHighlightsOfRaindrop<Fields>(id: Raindrop.ID) async throws -> HighlightsInRaindropResponse<Fields>

	@GET("/raindrop/{id}/cache")
	func getPermanentCopy(ofRaindropWith id: Raindrop.ID) async throws -> Data

	@GET("/raindrop/{id}/suggest")
	func suggestCollectionsAndTagsForExistingBookmark(id: Raindrop.ID) async throws -> RaindropSuggestionsResponse

	@GET("/raindrops/{collectionId}")
	func getRaindrops<Fields>(
		collectionId: Collection.ID,
		sort: Raindrop.Sort?,
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> RaindropsResponse<Fields>

	@GET("raindrops/{collectionId}/{format}")
	func exportInFormat(
		collectionId: Collection.ID,
		format: Raindrop.Format
	) async throws -> Data

	@POST("/raindrop")
	func createRaindrop<Fields>(
		link: String,
		title: String?,
		type: Raindrop.ItemType?,
		excerpt: String?,
		cover: URL?,
		order: Int?,
		collectionId: Collection.ID?,
		tags: [String]?,
		media: [Media]?,
		highlights: [Highlight.Content]?,
		reminder: Raindrop.Reminder?,
		important: Bool?,
		created: Date?,
		lastUpdate: Date?,
		pleaseParse: Parse?
	) async throws -> RaindropResponse<Fields>

	@POST("/raindrop/suggest")
	func suggestCollectionsAndTagsForNewBookmark(link: String) async throws -> RaindropSuggestionsResponse

	@PUT("/raindrop/{id}")
	func addHighlight<Fields>(
		id: Raindrop.ID,
		highlights: [Highlight.Content]
	) async throws -> HighlightsResponse<Fields>

	@PUT("/raindrop/{id}")
	func updateHighlight<Fields>(
		id: Raindrop.ID,
		highlights: [Highlight.Content.Identified]
	) async throws -> HighlightsResponse<Fields>

	@PUT("/raindrop/{id}")
	func removeHighlight<Fields>(
		id: Raindrop.ID,
		highlights: [Highlight.Content.Identified]
	) async throws -> HighlightsResponse<Fields>

	@DELETE("/raindrop/{id}")
	func removeRaindrop(id: Raindrop.ID) async throws

	@DELETE("/raindrops/{collectionId}")
	func removeRaindrops(
		collectionId: Collection.ID,
		ids: [Raindrop.ID]?,
		search: String?
	) async throws -> RaindropRemovalResponse
}

// MARK: -
public struct Parse: Encodable {
	public init() {}
}
