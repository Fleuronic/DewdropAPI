// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Collection
import struct Dewdrop.Tag

@API @JSON(decoder: .dewdrop)
public protocol FilterEndpoints: Sendable {
	@GET("/filters/{collectionId}")
	func getFilters(
		collectionId: Collection.ID,
		tagsSort: Tag.Sort?,
		search: String?
	) async throws -> FiltersResponse
}
