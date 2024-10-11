// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct Dewdrop.Collection
import struct DewdropService.FilterOverviewFields
import protocol DewdropService.FilterSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: FilterSpec {
	public func listFilters(forCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil, sortingTagsBy tagSort: Tag.Sort? = nil) async -> Self.Result<FilterOverviewFields> {
		await result {
			try await filters.getFilters(
				collectionId: id,
				tagsSort: tagSort,
				search: query
			)
		}
	}
}
