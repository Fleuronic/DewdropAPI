// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.HighlightFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	public func listHighlights(onPage page: Int?, listing highlightsPerPage: Int?) async -> Self.Result<[HighlightFields]> {
		let path = "highlights"
		let parameters = HighlightListParameters(
			page: page, 
			highlightsPerPage: highlightsPerPage
		)

		return await getResource(at: path, with: parameters)
	}

	public func listHighlights(inCollectionWith id: Collection.ID, onPage page: Int?, listing highlightsPerPage: Int?) async -> Self.Result<[HighlightFields]> {
		let path = "highlights/\(id)"
		let parameters = HighlightListParameters(
			page: page, 
			highlightsPerPage: highlightsPerPage
		)
		
		return await getResource(at: path, with: parameters)
	}
}
