// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.HighlightFields

@API @Mock @JSON(decoder: DewdropDecoder())
public protocol HighlightEndpoints {
	init(provider: Provider)
	
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

// MARK: -
public extension HighlightEndpointsMock {
	convenience init(provider: Provider) {
		self.init()
	}
}
