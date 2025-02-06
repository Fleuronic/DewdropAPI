// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct Dewdrop.Collection
import struct DewdropRESTAPI.FilterOverviewTotalFields
import protocol DewdropService.FilterSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: FilterSpec {
	#if swift(<6.0)
	public typealias FilterListFields = FilterSpecifiedFields
	#endif

	public func listFilters(forCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil, sortingTagsBy tagSort: Tag.Sort? = nil) async -> SingleResult<FilterSpecifiedFields> {
		await result {
			try await filterEndpoints.getFilters(
				collectionId: id,
				tagsSort: tagSort,
				search: query
			)
		}
	}
}
