// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.HighlightSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: HighlightSpec {
	#if swift(<6.0)
	public typealias HighlightListFields = HighlightSpecifiedFields
	public typealias HighlightInRaindropListFields = HighlightInRaindropSpecifiedFields
	#endif

	public func listHighlights(ofRaindropWith id: Raindrop.ID) async -> Results<HighlightInRaindropSpecifiedFields> {
		await result {
			try await highlights.getHighlightsOfRaindrop(id: id).item.highlights
		}
	}

	public func listHighlights(inCollectionWith id: Collection.ID = .all, onPage page: Int? = nil, listing highlightsPerPage: Int? = nil) async -> Results<HighlightSpecifiedFields> {
		await results {
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
}
