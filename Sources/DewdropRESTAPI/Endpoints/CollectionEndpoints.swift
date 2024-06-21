// Copyright © Fleuronic LLC. All rights reserved.

@preconcurrency import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network
import struct DewdropService.Identified

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints: Sendable {
	@GET("/collections")
	func getRootCollections() async throws -> CollectionsResponse

	@GET("/collections/childrens")
	func getChildCollections() async throws -> CollectionsResponse

	@GET("/user/stats")
	func getSystemCollections() async throws -> SystemCollectionsResponse
}
