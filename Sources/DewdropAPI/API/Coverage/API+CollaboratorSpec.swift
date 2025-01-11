// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
import struct DewdropRESTAPI.CollaboratorDetails
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

	public func changeRole(ofCollaboratorWith id: Collaborator.ID, inCollectionWith collectionID: Collection.ID, to role: Collaborator.Role) async -> EmptyResult {
		await result {
			try await collections.changeAccessLevelOfCollaborator(
				id: collectionID,
				userId: id,
				role: role
			)
		}
	}
}
