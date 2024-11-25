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
			try await collections.getCollaboratorsList(id: id).items
		}
	}
}
