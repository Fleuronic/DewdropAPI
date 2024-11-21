// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.RaindropFields

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints {
	@GET("/raindrop/{id}")
	func getRaindrop<Fields>(id: Raindrop.ID) async throws -> RaindropResponse<Fields>

	@GET("/raindrops/{collectionId}")
	func getRaindrops<Fields>(
		collectionId: Collection.ID,
		sort: Raindrop.Sort?,
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> RaindropsResponse<Fields>

	@GET("/raindrop/{id}/suggest")
	func suggestCollectionsAndTagsForExistingBookmark(id: Raindrop.ID) async throws -> RaindropSuggestionsResponse

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
		important: Bool?
	) async throws -> RaindropResponse<Fields>

	@DELETE("/raindrop/{id}")
	func removeRaindrop(id: Raindrop.ID) async throws

	@DELETE("/raindrops/{collectionId}")
	func removeRaindrops(
		collectionId: Collection.ID,
		ids: [Raindrop.ID]?,
		search: String?
	) async throws -> RaindropRemovalResponse
}
