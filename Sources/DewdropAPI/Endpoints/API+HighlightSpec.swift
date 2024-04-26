// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import struct Dewdrop.Highlight
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.HighlightFields
import protocol DewdropService.HighlightSpec

extension API: HighlightSpec {
	public func listHighlights(onPage page: Int?, listing highlightsPerPage: Int?) async -> Self.Result<[HighlightFields]> {
		await get(/.highlights) {
			HighlightListParameters(
				page: page,
				highlightsPerPage: highlightsPerPage
			)
		}
	}

	public func listHighlights(inCollectionWith id: Collection.ID, onPage page: Int?, listing highlightsPerPage: Int?) async -> Self.Result<[HighlightFields]> {
		await get(/.highlights, /id) {
			HighlightListParameters(
				page: page,
				highlightsPerPage: highlightsPerPage
			)
		}
	}
	
	public func addHighlights(with contents: [Highlight.Content], toRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		await put(/.raindrop, /id) {
			HighlightAdditionPayload(contents: contents)
		}.map(RaindropHighlightsFields.init)
	}
	
	public func updateHighlights(with ids: [Highlight.ID], ofRaindropWith id: Raindrop.ID, to contents: [Highlight.Content]) async -> Self.Result<RaindropHighlightsFields> {
		await put(/.raindrop, /id) {
			HighlightListPayload(
				ids: ids,
				contents: contents
			)
		}.map(RaindropHighlightsFields.init)
	}
	
	public func removeHighlights(with ids: [Highlight.ID], fromRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		await put(/.raindrop, /id) {
			HighlightRemovalPayload(ids: ids)
		}.map(RaindropHighlightsFields.init)
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case raindrop
	case highlights
}

private prefix func /(component: PathComponents) -> PathComponent { component }
