// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network
import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections<T: CollectionFields>() async throws -> ItemListResponse<T>

	@GET("/collections/childrens")
	func getChildCollections<T: CollectionFields>() async throws -> ItemListResponse<T>

	@GET("/user/stats")
	func getSystemCollections() async throws -> SystemCollectionsResponse
}
