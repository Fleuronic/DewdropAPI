// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

public import struct Dewdrop.Collection
public import struct Dewdrop.Tag
public import struct DewdropService.IdentifiedCollection

@API @JSON(decoder: .dewdrop)
public protocol FilterEndpoints {
	@GET("/filters/{collectionId}")
	func getFilters(
		collectionId: Collection.ID,
		tagsSort: Tag.Sort?,
		search: String?
	) async throws -> FiltersResponse
}
