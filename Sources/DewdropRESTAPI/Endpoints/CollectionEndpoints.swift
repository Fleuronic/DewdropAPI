// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

public import struct Dewdrop.Collection
public import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections<T: CollectionFields>() async throws -> ItemListResponse<T>

	@GET("/collections/childrens")
	func getChildCollections<T: CollectionFields>() async throws -> ItemListResponse<T>

	@GET("/user/stats")
	func getSystemCollectionsCount() async throws -> SystemCollectionsCountResponse

	@DELETE("/collection/{id}")
	func removeCollection(id: Collection.ID) async throws

	@DELETE("/collections")
	func removeMultipleCollections(ids: Field<[Collection.ID]>) async throws
}
