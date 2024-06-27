// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection

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
