// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Tag
public import struct Dewdrop.Collection
public import struct DewdropService.FilterOverviewFields
public import protocol DewdropService.FilterSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

extension API: FilterSpec {
	// TODO: Remove
	public typealias FilterListFields = FilterOverviewFields

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
