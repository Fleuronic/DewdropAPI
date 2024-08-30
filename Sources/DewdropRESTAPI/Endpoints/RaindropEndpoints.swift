// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import struct Foundation.URL
import protocol DewdropService.RaindropFields

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints {
	@GET("/raindrops/{collectionId}")
	func getRaindrops<Fields: RaindropFields & Decodable>(
		collectionId: Collection.ID,
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> ItemListResponse<Fields>

	@POST("/raindrop")
	func createRaindrop<Fields: RaindropFields & Decodable>(
		link: String,
		title: String?
	) async throws -> ItemResponse<Fields>
}
