// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import struct Identity.Identifier
import protocol DewdropService.CollectionFields

@API @JSON(decoder: .dewdrop)
public protocol CollectionEndpoints {
	@GET("/collections")
	func getRootCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/collections/childrens")
	func getChildCollections<Fields>() async throws -> CollectionsResponse<Fields>

	@GET("/collection/{id}")
	func getCollection<Fields>(id: Collection.ID) async throws -> CollectionResponse<Fields>

	@DELETE("/collection/{id}")
	func removeCollection(id: Collection.ID) async throws

	@DELETE("/collections")
	func removeMultipleCollections(ids: Field<[Collection.ID]>) async throws

	@PUT("/collections/clean")
	func removeAllEmptyCollections() async throws -> EmptyCollectionRemovalResponse

	@GET("/collection/{id}/sharing")
	func getCollaboratorsListOfCollection(id: Collection.ID) async throws -> CollaboratorsResponse
	
	@GET("/collections/covers/{text}")
	func searchForCover(text: String) async throws -> CoversResponse

	@GET("/collections/covers")
	func featuredCovers() async throws -> CoversResponse
}
