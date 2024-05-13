// Copyright © Fleuronic LLC. All rights reserved.

//import Catena
//
//import struct Dewdrop.Tag
//import struct Dewdrop.Collection
//import struct DewdropService.TagFields
//import protocol DewdropService.TagSpec
//
//extension API: TagSpec {
//	public func listTags(inCollectionWith id: Collection.ID? = nil) async -> Self.Result<[TagFields]> {
//		await get(/.tags, /id)
//	}
//	
//	public func renameTag(withName tagName: String, toName updatedTagName: String, inCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
//		await mergeTags(withNames: [tagName], intoTagNamed: updatedTagName, inCollectionWith: id)
//	}
//	
//	public func mergeTags(withNames tagNames: [String], intoTagNamed tagName: String, inCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
//		await put(/.tags, /id) {
//			TagRenamePayload(
//				tagNames: tagNames,
//				updatedTagName: tagName
//			)
//		}
//	}
//	
//	public func removeTags(withNames tagNames: [String], fromCollectionWith id: Collection.ID? = nil) async -> Self.Result<Void> {
//		await delete(/.tags, /id) {
//			TagRemovalPayload(tagNames: tagNames)
//		}
//	}
//}
//
//// MARK: -
//private enum PathComponents: String, PathComponent {
//	case tags
//}
//
//private prefix func /(component: PathComponents) -> PathComponent { component }
