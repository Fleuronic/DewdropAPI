// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropFields
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.RaindropSuggestionListFields
import struct Foundation.URL
import struct Foundation.Data
import protocol DewdropService.RaindropSpec

extension API: RaindropSpec {
	public func fetchDetails(forRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropDetailsFields> {
		await get(/.raindrop, /id)
	}

	public func fetchHighlights(forRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropHighlightsFields> {
		await fetchDetails(forRaindropWith: id).map(RaindropHighlightsFields.init)
	}
	
	public func downloadPermanentCopy(ofRaindropWith id: Raindrop.ID) async -> Self.Result<Data> {
		await get(/.raindrop, /id, /.cache)
	}
	
	public func listSuggestions(forRaindropWith id: Raindrop.ID) async -> Self.Result<RaindropSuggestionListFields> {
		await get(/.raindrop, /id, /.suggest)
	}
	
	public func listSuggestionsForNewRaindrop(with url: URL) async -> Self.Result<RaindropSuggestionListFields> {
		await post(/.raindrop, /.suggest) {
			RaindropSuggestionPayload(url: url)
		}
	}
	
	public func listRaindrops(inCollectionWith id: Collection.ID, searchingFor search: String? = nil, sortedBy sort: Raindrop.Sort? = nil, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Self.Result<[RaindropFields]> {
		await get(/.raindrops, /id) {
			RaindropListParameters(
				sort: sort,
				page: page,
				raindropsPerPage: raindropsPerPage,
				search: search
			)
		}
	}
	
	public func removeRaindrop(with id: Raindrop.ID) async -> Self.Result<Void> {
		await delete(/.raindrop, /id)
	}
	
	public func removeRaindrops(fromCollectionWith id: Collection.ID? = nil, matching ids: [Raindrop.ID]? = nil, searchingFor search: String? = nil) async -> Self.Result<Void> {
		await delete(/.raindrops, /id) {
			ids.map(RaindropRemovalPayload.init)
		} parameters: {
			RaindropParameters(search: search)
		}
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case raindrop
	case raindrops
	case suggest
	case cache
}

private prefix func /(component: PathComponents) -> PathComponent { component }
