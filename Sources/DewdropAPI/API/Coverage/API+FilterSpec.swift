// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct Dewdrop.Collection
import struct DewdropService.FilterOverviewFields
import protocol DewdropService.FilterSpec
import protocol Catena.Scoped

extension API: FilterSpec {
	public typealias FilterListFields = FilterOverviewFields
	
	public func listFilters(forCollectionWith id: Collection.ID = .all, searchingFor search: String? = nil, sortingTagsBy tagSort: Tag.Sort? = nil) async -> Result<FilterListFields> {
		await result { 
			try await filters.getFilters(
				collectionId: id,
				tagsSort: tagSort,
				search: search
			)
		}
	}
}
