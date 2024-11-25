// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.HighlightFields

@API @JSON(decoder: .dewdrop)
public protocol HighlightEndpoints {
	@GET("/highlights")
	func getAllHighlights<Fields>(
		page: Int?,
		perpage: Int?
	) async throws -> HighlightsResponse<Fields>

	@GET("/highlights/{collectionId}")
	func getAllHighlightsInCollection<Fields>(
		collectionId: Collection.ID,
		page: Int?,
		perpage: Int?
	) async throws -> HighlightsResponse<Fields>

	@GET("/raindrop/{id}")
	func getHighlightsOfRaindrop<Fields>(
		id: Raindrop.ID
	) async throws -> HighlightsInRaindropResponse<Fields>
}
