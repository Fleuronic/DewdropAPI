// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Foundation

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection

@API @Mock @JSON(decoder: DewdropDecoder())
public protocol TagEndpoints {
	init(provider: Provider)
	
	@GET("/tags/{collectionId}")
	func getTags(collectionId: Collection.ID?) async throws -> TagsResponse

	@PUT("/tags/{collectionId}")
	func renameTag(collectionId: Collection.ID?, replace: String, tags: [String]) async throws -> SuccessResponse

	@PUT("/tags/{collectionId}")
	func mergeTags(collectionId: Collection.ID?, replace: String, tags: [String]) async throws -> SuccessResponse

	@DELETE("/tags/{collectionId}")
	func removeTags(collectionId: Collection.ID?, tags: Field<[String]>) async throws -> SuccessResponse
}

// MARK: -
public extension TagEndpointsMock {
	convenience init(provider: Provider) {
		self.init()
	}
}
