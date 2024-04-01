// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollaboratorFields
import struct DewdropService.CoverFields
import protocol DewdropService.CollectionSpec
import protocol Catenary.API

extension API: CollectionSpec {
	public func fetchCollectionDetails(with id: Collection.ID) async -> Self.Result<CollectionDetailsFields> {
		let path = "collection/\(id)"
		return await getResource(at: path)
	}

	public func listRootCollections() async -> Self.Result<[CollectionFields]> {
		let path = "collections"
		return await getResource(at: path)
	}

	public func listChildCollections() async -> Self.Result<[CollectionFields]> {
		let path = "collections/childrens"
		return await getResource(at: path)
	}

	public func listCollaborators(ofCollectionWith id: Collection.ID) async -> Self.Result<[CollaboratorFields]> {
		let path = "collection/\(id)/sharing"
		return await getResource(at: path)
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
