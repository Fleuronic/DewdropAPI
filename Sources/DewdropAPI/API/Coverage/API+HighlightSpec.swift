// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.HighlightDetailsFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: HighlightSpec {
	public func listHighlights(onPage page: Int?, listing highlightsPerPage: Int?) async -> Response<[HighlightListFields]> {
		await response {
			fatalError()
		}
	}

	public func listHighlights(ofRaindropWith id: Raindrop.ID) async -> Response<[HighlightListFields]> {
		await response {
			fatalError()
		}
	}
}
