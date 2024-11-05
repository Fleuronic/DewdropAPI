// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/collections/childrens")
	func getChildCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/user/stats")
	func getSystemCollectionsCount() async throws -> SystemCollectionsCountResponse

	@DELETE("/collection/{id}")
	func removeCollection(id: Collection.ID) async throws

	@DELETE("/collections")
	func removeMultipleCollections(ids: Field<[Collection.ID]>) async throws
}
