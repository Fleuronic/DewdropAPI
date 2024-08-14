// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network
import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections<CollectionListFields: CollectionFields & Decodable>() async throws -> ListResponse<CollectionListFields>

	@GET("/collections/childrens")
	func getChildCollections<CollectionListFields: CollectionFields & Decodable>() async throws -> ListResponse<CollectionListFields>

	@GET("/user/stats")
	func getSystemCollections() async throws -> SystemCollectionsResponse
}
