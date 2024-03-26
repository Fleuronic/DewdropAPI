// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionListFields
import protocol DewdropService.CollectionSpec
import protocol Catenary.API

extension API: CollectionSpec {
	public func listCollections() async -> Self.Result<[CollectionListFields]> {
		let path = "collections"
		return await getResource(at: path)
	}
}
