// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.PendingIdentifier
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropRESTAPI.RaindropSuggestionsFields
import struct DewdropRESTAPI.RaindropRemovalFields
import struct Foundation.URL
import protocol DewdropService.RaindropSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: RaindropSpec {
	#if swift(<6.0)
	public typealias RaindropFetchFields = RaindropSpecifiedFields
	public typealias RaindropListFields = RaindropSpecifiedFields
	public typealias RaindropCreationFields = RaindropCreationSpecifiedFields
	#endif

	public func fetchRaindrop(with id: Dewdrop.Raindrop.ID) async -> SingleResult<RaindropSpecifiedFields> {
		await result {
			try await raindrops.getRaindrop(id: id).item
		}
	}

	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil, sortedBy sort: Raindrop.Sort? = nil, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Results<RaindropSpecifiedFields> {
		await results {
			try await raindrops.getRaindrops(
				collectionId: id,
				sort: sort,
				perpage: raindropsPerPage,
				page: page,
				search: query
			).items
		}
	}

	public func findSuggestions(forRaindropWith id: Raindrop.ID) async -> SingleResult<RaindropSuggestionsFields> {
		await result {
			try await raindrops.suggestCollectionsAndTagsForExistingBookmark(id: id).item
		}
	}

	public func removeRaindrop(with id: Raindrop.ID) async -> EmptyResult {
		await result {
			try await raindrops.removeRaindrop(id: id)
		}
	}

	public func removeRaindrops(fromCollectionWith collectionID: Collection.ID, matching ids: [Raindrop.ID]? = nil, searchingFor search: String? = nil) async -> SingleResult<RaindropRemovalFields> {
		await result {
			try await raindrops.removeRaindrops(
				collectionId: collectionID,
				ids: ids,
				search: search
			)
		}
	}

	public func createRaindrop(
		id: Raindrop.PendingID = .fromServer,
		url: URL,
		title: String? = nil,
		itemType: Raindrop.ItemType? = nil,
		excerpt: String? = nil,
		coverURL: URL? = nil,
		order: Int? = nil,
		collectionID: Collection.ID? = nil,
		tagNames: [String]? = nil,
	//	media: [Media]?, // TODO
	//	highlightContents: [Highlight.Content]?, // TODO
		isFavorite: Bool? = nil
	//	creationDate: Date?, // TODO: Dates parsed incorrectly
	//	updateDate: Date?, // TODO:
	//	shouldParse: Bool // TODO:
	) async -> SingleResult<RaindropCreationSpecifiedFields> {
		await result {
			try await raindrops.createRaindrop(
				link: url.absoluteString,
				title: title,
				type: itemType,
				excerpt: excerpt,
				cover: coverURL,
				order: order,
				collectionId: collectionID,
				tags: tagNames,
				important: isFavorite
			).item
		}
	}
}
