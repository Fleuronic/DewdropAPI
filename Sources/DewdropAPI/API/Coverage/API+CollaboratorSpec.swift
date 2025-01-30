// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
import struct DewdropRESTAPI.CollaboratorDetails
import struct DewdropRESTAPI.CollaboratorRoleFields
import struct Identity.Identifier
import protocol DewdropService.CollaboratorSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollaboratorSpec {
	#if swift(<6.0)
	public typealias CollaboratorListFields = CollaboratorDetails
	#endif

	public func listCollaborators(ofCollectionWith id: Collection.ID) async -> Results<CollaboratorDetails> {
		await results {
			try await collections.getCollaboratorsListOfCollection(id: id).items
		}
	}

	public func shareCollection(with id: Collection.ID, toCollaborateAs role: Collaborator.Role, sendingTo emails: [String]) async -> SingleResult<Collaborator.Invitation> {
		await result {
			try await collections.shareCollection(
				id: id,
				role: role,
				emails: emails
			)
		}
	}

	public func acceptInvitation(forCollectionWith id: Collection.ID, usingToken token: String) async -> SingleResult<CollaboratorRoleFields> {
		await result {
			try await collections.acceptInvitation(
				id: id,
				token: token
			).item
		}
	}

	public func changeRole(ofCollaboratorWith id: Collaborator.ID, inCollectionWith collectionID: Collection.ID, to role: Collaborator.Role) async -> SuccessResult {
		await result {
			try await collections.changeAccessLevelOfCollaborator(
				id: collectionID,
				userId: id,
				role: role
			).result
		}
	}

	public func removeCollaborator(with id: Collaborator.ID, fromCollectionWith collectionID: Collection.ID) async -> SuccessResult {
		await result {
			try await collections.deleteCollaborator(
				id: collectionID,
				userId: id
			).result
		}
	}

	public func stopSharingCollection(with id: Collection.ID) async -> SuccessResult {
		await result {
			try await collections.unshareOrLeaveCollection(id: id).result
		}
	}
}
