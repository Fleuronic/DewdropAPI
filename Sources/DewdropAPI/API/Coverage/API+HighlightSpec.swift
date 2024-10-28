// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.HighlightDetailsFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	// TODO: Remove
	public typealias HighlightListResult = Self.Result<HighlightDetailsFields>

	public func listHighlights(onPage page: Int?, listing highlightsPerPage: Int?) async -> Self.Result<HighlightDetailsFields> {
		await result {
			fatalError()
		}
	}

	public func listHighlights(ofRaindropWith id: Raindrop.ID) async -> Self.Result<HighlightDetailsFields> {
		await result {
			fatalError()
		}
	}
}
