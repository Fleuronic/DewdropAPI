// Copyright © Fleuronic LLC. All rights reserved.

@preconcurrency import Papyrus

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection

@API @JSON(decoder: .dewdrop)
public protocol TagEndpoints: Sendable {
	@GET("/tags/{collectionId}")
	func getTags(collectionId: Collection.ID?) async throws -> TagsResponse

	@PUT("/tags/{collectionId}")
	func renameTag(collectionId: Collection.ID?, replace: String, tags: [String]) async throws

	@PUT("/tags/{collectionId}")
	func mergeTags(collectionId: Collection.ID?, replace: String, tags: [String]) async throws

	@DELETE("/tags/{collectionId}")
	func removeTags(collectionId: Collection.ID?, tags: [String]) async throws
}
