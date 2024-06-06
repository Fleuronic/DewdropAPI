// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network
import struct DewdropService.IdentifiedUser

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections() async throws -> CollectionsResponse
}
