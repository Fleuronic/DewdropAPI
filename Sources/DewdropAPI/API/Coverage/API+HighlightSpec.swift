// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.HighlightSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: HighlightSpec {	
	public func listHighlights(inCollectionWith id: Collection.ID = .all, onPage page: Int? = nil, listing highlightsPerPage: Int? = nil) async -> Response<[HighlightResponseFields]> {
		await response {
			switch id {
			case .all:
				try await highlights.getAllHighlights(
					page: page,
					perpage: highlightsPerPage
				).items
			default:
				try await highlights.getAllHighlightsInCollection(
					collectionId: id,
					page: page,
					perpage: highlightsPerPage
				).items
			}
		}
	}

	public func listHighlights(ofRaindropWith id: Raindrop.ID) async -> Response<RaindropHighlightResponseFields> {
		await response {
			try await highlights.getHighlightsOfRaindrop(id: id).item
		}
	}
}
