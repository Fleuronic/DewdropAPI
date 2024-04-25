// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
import struct Dewdrop.User
import struct DewdropService.CollectionFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import struct DewdropService.CollectionMergeFields
import struct DewdropService.CountFields
import struct DewdropService.CollaboratorFields
import struct DewdropService.CollaboratorEmailListFields
import struct DewdropService.CollaboratorRoleFields
import struct DewdropService.CoverFields
import protocol DewdropService.CollectionSpec
import protocol Catena.API

extension API: CollectionSpec {
	public func listRootCollections() async -> Self.Result<[CollectionFields]> {
		let path = "collections"
		return await getResource(at: path)
	}

	public func listChildCollections() async -> Self.Result<[CollectionFields]> {
		let path = "collections/childrens"
		return await getResource(at: path)
	}

	public func listSystemCollections() async -> Self.Result<[CollectionCountFields]> {
		let path = "import/url/parse"
		return await getResource(at: path)
	}

	public func fetchCollectionDetails(with id: Collection.ID) async -> Self.Result<CollectionDetailsFields> {
		let path = "collection/\(id)"
		return await getResource(at: path)
	}

	public func listCollaborators(ofCollectionWith id: Collection.ID) async -> Self.Result<[CollaboratorFields]> {
		let path = "collection/\(id)/sharing"
		return await getResource(at: path)
	}
	
	public func expandCollections(_ expanded: Bool) async -> Self.Result<Void> {
		let path = "collections"
		let parameters = CollectionExpansionParameters(expanded: expanded)
		return await put(at: path, with: parameters)
	}
	
	public func unshareLeaveCollection(with id: Collection.ID) async -> Self.Result<Void> {
		let path = "collection/\(id)/sharing"
		return await deleteResource(at: path)
	}
	
	public func removeCollaborator(with id: User.ID, fromCollectionWith collectionID: Collection.ID) async -> Self.Result<Void> {
		let path = "collection/\(collectionID)/sharing/\(id)"
		return await deleteResource(at: path)
	}
	
	public func removeCollection(with id: Collection.ID) async -> Self.Result<Void> {
		let path = "collection/\(id)"
		return await deleteResource(at: path)		
	}
	
	public func removeCollections(with ids: [Collection.ID]) async -> Self.Result<Void> {
		let path = "collections"
		let payload = CollectionRemovalPayload(ids: ids)
		return await deleteResource(at: path, using: payload)
	}
	
	public func removeEmptyCollections() async -> Self.Result<CountFields> {
		let path = "collections/clean"
		return await put(at: path)
	}

	public func emptyTrash() async -> Self.Result<Void> {
		await removeCollection(with: .trash)
	}

	public func searchForCovers(with text: String) async -> Self.Result<[CoverFields]> {
		let path = "collections/covers/\(text)"
		return await getResource(at: path)
	}

	public func listFeaturedCovers() async -> Self.Result<[CoverFields]> {
		let path = "collections/covers"
		return await getResource(at: path)
	}
	
	public func reorderCollections(by sort: Collection.Sort) async -> Self.Result<Void> {
		let path = "collections"
		let payload = CollectionReorderPayload(sort: sort)
		return await put(payload, at: path)
	}
	
	public func mergeCollections(with ids: [Collection.ID], intoCollectionWith id: Collection.ID) async -> Self.Result<CollectionMergeFields> {
		let path = "collections/merge"
		let payload = CollectionMergePayload(
			sourceIDs: ids,
			destinationID: id
		)
		
		return await put(payload, at: path)
	}
	
	public func shareCollection(with id: Collection.ID, toUsersWithEmails emails: [String], as role: Collaborator.Role) async -> Self.Result<CollaboratorEmailListFields> {
		let path = "collections/\(id)/sharing"
		let payload = CollectionSharePayload(
			role: role,
			emails: emails
		)

		return await post(payload, to: path)
	}
	
	public func acceptInvitation(toJoinCollectionWith id: Collection.ID, viaEmailWithToken token: String) async -> Self.Result<CollaboratorRoleFields> {
		let path = "collections/\(id)/join"
		let payload = CollectionJoinPayload(token: token)
		return await post(payload, to: path)
	}
	
	public func changeAccessLevelOfCollaborator(with id: User.ID, inCollectionWith collectionID: Collection.ID, to role: Collaborator.Role) async -> Self.Result<Void> {
		let path = "collection/\(collectionID)/sharing/\(id)"
		let payload = CollaboratorUpdatePayload(role: role)
		return await put(payload, at: path)
	}
}
