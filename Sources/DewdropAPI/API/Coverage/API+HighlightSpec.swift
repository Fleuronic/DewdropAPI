// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.HighlightDetailsFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	// TODO: Remove
	public typealias HighlightListResult = Response<HighlightDetailsFields>

	public func listHighlights(onPage page: Int?, listing highlightsPerPage: Int?) async -> Response<HighlightDetailsFields> {
		await response {
			fatalError()
		}
	}

	public func listHighlights(ofRaindropWith id: Raindrop.ID) async -> Response<HighlightDetailsFields> {
		await response {
			fatalError()
		}
	}
}
