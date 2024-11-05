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
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> RaindropsResponse<Fields>

	@POST("/raindrop")
	func createRaindrop<Fields>(
		link: String,
		title: String?
	) async throws -> RaindropResponse<Fields>
}
