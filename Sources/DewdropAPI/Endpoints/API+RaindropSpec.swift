// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.RaindropSuggestionListFields
import protocol DewdropService.RaindropSpec
import protocol Catenary.API

extension API: RaindropSpec {
	public func fetchRaindropDetails(with id: Raindrop.ID) async -> Self.Result<RaindropDetailsFields> {
		let path = "raindrop/\(id)"
		return await getResource(at: path)
	}

	public func fetchRaindropHighlights(with id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		await fetchRaindropDetails(with: id).map(RaindropHighlightsFields.init)
	}

	public func listSuggestions(forRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropSuggestionListFields> {
		let path = "raindrop/\(id)/suggest"
		return await getResource(at: path)
	}
}
