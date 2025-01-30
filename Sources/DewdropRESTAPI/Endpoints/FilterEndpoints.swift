// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import struct Dewdrop.Tag
import struct DewdropService.IdentifiedCollection

@API @Mock @JSON(decoder: .dewdrop)
public protocol FilterEndpoints {
	@GET("/filters/{collectionId}")
	func getFilters<Fields>(
		collectionId: Collection.ID,
		tagsSort: Tag.Sort?,
		search: String?
	) async throws -> FiltersResponse<Fields>
}
