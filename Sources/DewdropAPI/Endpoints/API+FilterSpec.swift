// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct Dewdrop.Collection
import struct DewdropService.FilterListFields
import protocol DewdropService.FilterSpec
import protocol Catenary.API

extension API: FilterSpec {
	public func listFilters(forCollectionWith id: Collection.ID = .all, searchingFor search: String? = nil, sortingTagsBy tagSort: Tag.Sort? = nil) async -> Self.Result<FilterListFields> {
		let path = "filters/\(id)"
		let parameters = FilterListParameters(
			search: search, 
			tagSort: tagSort
		)
		
		return await getResource(at: path, with: parameters)
	}
}
