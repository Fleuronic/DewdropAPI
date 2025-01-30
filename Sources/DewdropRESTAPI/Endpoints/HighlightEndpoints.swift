// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.HighlightFields

@API @Mock @JSON(decoder: .dewdrop)
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
}
