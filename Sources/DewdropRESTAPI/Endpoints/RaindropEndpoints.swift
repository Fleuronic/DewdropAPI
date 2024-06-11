// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints {
	@GET("/raindrops/{collectionId}")
	func getRaindrops(
		collectionId: Collection.ID,
		search: String?
	) async throws -> RaindropsResponse
}
