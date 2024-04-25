// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct Dewdrop.Collection
import struct DewdropService.TagFields
import protocol DewdropService.TagSpec
import protocol Catenary.API

extension API: TagSpec {
	public func listTags(inCollectionWith id: Collection.ID? = nil) async -> Self.Result<[TagFields]> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "tags" + collectionPath
		return await getResource(at: path)
	}
	
	public func renameTag(withName tagName: String, toName updatedTagName: String, inCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
		await mergeTags(withNames: [tagName], intoTagNamed: updatedTagName, inCollectionWith: id)
	}
	
	public func mergeTags(withNames tagNames: [String], intoTagNamed tagName: String, inCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "tags" + collectionPath
		let payload = TagRenamePayload(
			tagNames: tagNames,
			updatedTagName: tagName
		)
		
		return await put(payload, at: path)
	}
	
	public func removeTags(withNames tagNames: [String], fromCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "tags" + collectionPath
		let payload = TagRemovalPayload(tagNames: tagNames)
		return await deleteResource(at: path, using: payload)
	}
}
