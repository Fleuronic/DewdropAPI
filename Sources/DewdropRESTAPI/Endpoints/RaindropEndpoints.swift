// Copyright © Fleuronic LLC. All rights reserved.

@preconcurrency import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.Identified

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints: Sendable {
	@GET("/raindrops/{collectionId}")
	func getRaindrops(
		collectionId: Collection.ID,
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> RaindropsResponse
}
