// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import struct Identity.Identifier
import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collection/{id}")
	func getCollection<Fields>(id: Collection.ID) async throws -> CollectionResponse<Fields>

	@GET("/collections")
	func getRootCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/collections/childrens")
	func getChildCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/collection/{id}/sharing")
	func getCollaboratorsList(id: Collection.ID) async throws -> CollaboratorsResponse

	@PUT("/collections/clean")
	func removeAllEmptyCollections() async throws -> EmptyCollectionRemovalResponse

	@DELETE("/collection/{id}")
	func removeCollection(id: Collection.ID) async throws

	@DELETE("/collections")
	func removeMultipleCollections(ids: Field<[Collection.ID]>) async throws
}
