// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
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
	
	public func addHighlights(with contents: [Highlight.Content], toRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		let path = "raindrop/\(id)"
		let payload = HighlightAdditionPayload(contents: contents)
		return await put(payload, at: path).map(RaindropHighlightsFields.init)
	}
	
	public func updateHighlights(with ids: [Highlight.ID], ofRaindropWith id: Raindrop.ID, to contents: [Highlight.Content]) async -> Self.Result<RaindropHighlightsFields> {
		let path = "raindrop/\(id)"
		let payload = HighlightListPayload(
			ids: ids,
			contents: contents
		)
		
		return await put(payload, at: path).map(RaindropHighlightsFields.init)
	}
	
	public func removeHighlights(with ids: [Highlight.ID], fromRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		let path = "raindrop/\(id)"
		let payload = HighlightRemovalPayload(ids: ids)
		return await put(payload, at: path).map(RaindropHighlightsFields.init)
	}
}
