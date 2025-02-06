// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
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
			try await raindropEndpoints.getHighlightsOfRaindrop(id: id).item.highlights
		}
	}

	public func listHighlights(inCollectionWith id: Collection.ID = .all, onPage page: Int? = nil, listing highlightsPerPage: Int? = nil) async -> Results<HighlightSpecifiedFields> {
		await results {
			switch id {
			case .all:
				try await highlightEndpoints.getAllHighlights(
					page: page,
					perpage: highlightsPerPage
				).items
			default:
				try await highlightEndpoints.getAllHighlightsInCollection(
					collectionId: id,
					page: page,
					perpage: highlightsPerPage
				).items
			}
		}
	}

	public func addHighlights(with contents: [Highlight.Content], toRaindropWith id: Raindrop.ID) async -> Results<HighlightInRaindropSpecifiedFields> {
		await results {
			try await raindropEndpoints.addHighlight(
				id: id,
				highlights: contents
			).items
		}
	}

	public func updateHighlights(with ids: [Highlight.ID], ofRaindropWith id: Raindrop.ID, to contents: [Highlight.Content]) async -> Results<HighlightInRaindropSpecifiedFields> {
		let highlights = zip(ids, contents).map(Highlight.Content.Identified.init)
		return await results {
			try await raindropEndpoints.updateHighlight(
				id: id,
				highlights: highlights
			).items
		}
	}

	public func removeHighlights(with ids: [Highlight.ID], fromRaindropWith id: Raindrop.ID) async -> Results<HighlightInRaindropSpecifiedFields> {
		let highlights = ids.map { id in
			Highlight.Content.Identified(
				id: id,
				content: .init(text: "")
			)
		}

		return await results {
			try await raindropEndpoints.removeHighlight(
				id: id,
				highlights: highlights
			).items
		}
	}
}
