// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import protocol DewdropService.RaindropFields

@API @JSON(decoder: .dewdrop)
public protocol RaindropEndpoints {
	@GET("/raindrops/{collectionId}")
	func getRaindrops<RaindropListFields: RaindropFields & Decodable>(
		collectionId: Collection.ID,
		perpage: Int?,
		page: Int?,
		search: String?
	) async throws -> ListResponse<RaindropListFields>
}
