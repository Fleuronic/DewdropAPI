// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
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

	@PUT("/collections/clean")
	func removeAllEmptyCollections() async throws -> EmptyCollectionRemovalResponse

	@GET("/collection/{id}/sharing")
	func getCollaboratorsListOfCollection(id: Collection.ID) async throws -> CollaboratorsResponse
	
	@GET("/collections/covers/{text}")
	func searchForCover(text: String) async throws -> CoversResponse

	@GET("/collections/covers")
	func featuredCovers() async throws -> CoversResponse

	@POST("/collection/{id}/sharing")
	func shareCollection(
		id: Collection.ID,
		role: Collaborator.Role,
		emails: [String]
	) async throws -> Collaborator.Invitation

	@POST("/collection/{id}/join")
	func acceptInvitation(
		id: Collection.ID,
		token: String
	) async throws -> CollaboratorRoleResponse

	@PUT("/collections")
	func expandCollapseCollections(expanded: Bool) async throws -> SuccessResponse

	@PUT("/collections")
	func reorderCollections(sort: Collection.Sort) async throws -> SuccessResponse

	@PUT("/collections/merge")
	func mergeCollections(
		to: Collection.ID,
		ids: [Collection.ID]
	) async throws -> SuccessResponse

	@Multipart
	@PUT("/collection/{id}/cover")
	func uploadCover<Fields>(
		id: Collection.ID,
		cover: Part
	) async throws -> CollectionResponse<Fields>

	@PUT("/collection/{id}/sharing/{userId}")
	func changeAccessLevelOfCollaborator(
		id: Collection.ID,
		userId: Collaborator.ID,
		role: Collaborator.Role
	) async throws -> SuccessResponse

	@DELETE("/collection/{id}")
	func removeCollection(id: Collection.ID) async throws -> SuccessResponse

	@DELETE("/collections")
	func removeMultipleCollections(ids: Field<[Collection.ID]>) async throws -> SuccessResponse

	@DELETE("/collection/{id}/sharing")
	func unshareOrLeaveCollection(id: Collection.ID) async throws -> SuccessResponse

	@DELETE("/collection/{id}/sharing/{userId}")
	func deleteCollaborator(
		id: Collection.ID,
		userId: Collaborator.ID
	) async throws -> SuccessResponse
}
