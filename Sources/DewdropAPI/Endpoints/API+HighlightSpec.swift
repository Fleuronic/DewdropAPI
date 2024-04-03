// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.HighlightFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	public func listHighlights() async -> Self.Result<[HighlightFields]> {
		let path = "highlights"
		return await getResource(at: path)		
	}

	public func listHighlights(inCollectionWith id: Collection.ID) async -> Self.Result<[HighlightFields]> {
		let path = "highlights/\(id)"
		return await getResource(at: path)
	}
}
