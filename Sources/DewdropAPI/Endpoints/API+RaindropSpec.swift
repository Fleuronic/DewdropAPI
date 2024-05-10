// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import enum Dewdrop.ItemType
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.Media
import struct Dewdrop.Highlight
import struct DewdropService.RaindropFields
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropCreationFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.RaindropSuggestionListFields
import struct Catena.Upload
import struct Foundation.URL
import struct Foundation.Date
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
	
	public func createRaindrop(
		url: URL,
		title: String? = nil,
		itemType: ItemType? = nil,
		excerpt: String? = nil,
		coverURL: URL? = nil,
		order: Int? = nil,
		collectionID: Collection.ID? = nil,
		tagNames: [String]? = nil,
		media: [Media]? = nil,
		highlightContents: [Highlight.Content]? = nil,
		isFavorite: Bool? = nil,
		isBroken: Bool? = nil,
		creationDate: Date? = nil,
		updateDate: Date? = nil,
		shouldParse: Bool = false
	) async -> Self.Result<RaindropCreationFields> {
		await post(/.raindrop) {
			RaindropPayload(
				url: url,
				title: title,
				itemType: itemType,
				excerpt: excerpt,
				coverURL: coverURL,
				order: order,
				collectionID: collectionID,
				tagNames: tagNames,
				media: media,
				highlightContents: highlightContents,
				isFavorite: isFavorite,
				isBroken: isBroken,
				creationDate: creationDate,
				updateDate: updateDate,
				shouldParse: shouldParse
			)
		}
	}
	
	public func createRaindrops(
		data: [
			(
				url: URL,
				title: String?,
				itemType: ItemType?,
				excerpt: String?,
				coverURL: URL?,
				order: Int?,
				collectionID: Collection.ID?,
				tagNames: [String]?,
				media: [Media]?,
				highlightContents: [Highlight.Content]?,
				isFavorite: Bool?,
				isBroken: Bool?,
				creationDate: Date?,
				updateDate: Date?,
				shouldParse: Bool
			)
		]
	) async -> Self.Result<[RaindropCreationFields]> {
		await post(/.raindrops) {
			ListPayload(items: data.map(RaindropPayload.init))
		}
	}
	
	public func uploadCover(forRaindropWith id: Raindrop.ID, usingFileAt url: URL, withName filename: String) async -> Self.Result<RaindropFields> {
		await put(/.raindrop, /id, /.cover, upload: {
			Upload(
				url: url,
				name: "cover",
				filename: filename
			)
		})
	}
	
	public func uploadFile(at url: URL, withName filename: String, toCollectionWith id: Collection.ID? = nil) async -> Self.Result<RaindropCreationFields> {
		await put(/.raindrop, /.file) {
			id.map(RaindropUploadPayload.init)
		} upload: {
			Upload(
				url: url,
				name: "file",
				filename: filename
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
	case file
	case cache
	case cover
}

private prefix func /(component: PathComponents) -> PathComponent { component }
