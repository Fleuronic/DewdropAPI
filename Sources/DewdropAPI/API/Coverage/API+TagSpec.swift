// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropRESTAPI.TagCountFields
import struct Identity.Identifier
import protocol DewdropService.TagSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: TagSpec {
	#if swift(<6.0)
	public typealias TagListFields = TagCountFields
	#endif

	public func listTags(inCollectionWith id: Collection.ID? = nil) async -> Results<TagCountFields> {
		await results {
			try await tags.getTags(collectionId: id).items
		}
	}

	public func renameTag(withName tagName: String, toName updatedTagName: String, inCollectionWith id: Collection.ID? = nil) async -> NoResult {
		await mergeTags(withNames: [tagName], intoTagNamed: updatedTagName, inCollectionWith: id)
	}

	public func mergeTags(withNames tagNames: [String], intoTagNamed tagName: String, inCollectionWith id: Collection.ID? = nil) async -> NoResult {
		await result {
			try await tags.mergeTags(
				collectionId: id,
				replace: tagName,
				tags: tagNames
			)
		}
	}
	
	public func removeTags(withNames tagNames: [String], fromCollectionWith id: Collection.ID? = nil) async -> NoResult {
		await result {
			try await tags.removeTags(
				collectionId: id,
				tags: tagNames
			)
		}
	}
}
