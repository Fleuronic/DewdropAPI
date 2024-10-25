// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Raindrop
public import struct DewdropService.HighlightDetailsFields
public import protocol DewdropService.HighlightSpec
public import protocol Catenary.API

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
