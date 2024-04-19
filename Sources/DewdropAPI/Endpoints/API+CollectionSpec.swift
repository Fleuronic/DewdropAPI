// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropService.CollectionFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import struct DewdropService.CountFields
import struct DewdropService.CollaboratorFields
import struct DewdropService.CoverFields
import protocol DewdropService.CollectionSpec
import protocol Catenary.API

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
}
