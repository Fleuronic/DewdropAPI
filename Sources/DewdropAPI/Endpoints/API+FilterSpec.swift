// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.FilterListFields
import protocol DewdropService.FilterSpec
import protocol Catenary.API

extension API: FilterSpec {
	public func listFilters(forCollectionWith id: Collection.ID? = nil) async -> Self.Result<FilterListFields> {
		let path = "backups"
		return await getResource(at: path)
	}
}
