// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.TagCountFields
import struct Identity.Identifier
import protocol DewdropService.TagSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: TagSpec {
	#if swift(<6.0)
	public typealias TagListFields = TagCountFields
	#endif

	public func listTags(inCollectionWith id: Collection.ID? = nil) async -> Response<[TagCountFields]> {
		await response {
			try await tags.getTags(collectionId: id).items
		}
	}

	public func renameTag(withName tagName: String, toName updatedTagName: String, inCollectionWith id: Collection.ID? = nil) async -> Response<Void> {
		await mergeTags(withNames: [tagName], intoTagNamed: updatedTagName, inCollectionWith: id)
	}

	public func mergeTags(withNames tagNames: [String], intoTagNamed tagName: String, inCollectionWith id: Collection.ID? = nil) async -> Response<Void> {
		await response {
			try await tags.mergeTags(
				collectionId: id,
				replace: tagName,
				tags: tagNames
			)
		}
	}

	public func removeTags(withNames tagNames: [String], fromCollectionWith id: Collection.ID? = nil) async -> Response<Void> {
		await response {
			try await tags.removeTags(
				collectionId: id,
				tags: tagNames
			)
		}
	}
}
