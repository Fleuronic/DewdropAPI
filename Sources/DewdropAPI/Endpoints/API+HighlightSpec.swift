// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.HighlightFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	public func listHighlights(inCollectionWith id: Collection.ID? = nil) async -> Self.Result<[HighlightFields]> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "highlights" + collectionPath
		return await getResource(at: path)
	}
}
