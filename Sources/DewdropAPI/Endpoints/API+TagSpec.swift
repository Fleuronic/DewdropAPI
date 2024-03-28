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
}
