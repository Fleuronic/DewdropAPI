// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections() async throws -> CollectionsResponse

	@GET("/collections/childrens")
	func getChildCollections() async throws -> CollectionsResponse

	@GET("/user/stats")
	func getSystemCollections() async throws -> SystemCollectionsResponse
}
