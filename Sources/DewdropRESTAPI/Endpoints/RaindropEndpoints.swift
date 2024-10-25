// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

public import struct Dewdrop.Collection
public import protocol DewdropService.RaindropFields

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
