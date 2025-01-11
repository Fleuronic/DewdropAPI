// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.PendingIdentifier
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.Media
import struct Dewdrop.Highlight
import struct DewdropRESTAPI.RaindropSuggestionsFields
import struct DewdropRESTAPI.RaindropRemovalFields
import struct Foundation.URL
import struct Foundation.Date
import struct Foundation.Data
import protocol DewdropService.RaindropSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: RaindropSpec {
	#if swift(<6.0)
	public typealias RaindropFetchFields = RaindropSpecifiedFields
	public typealias RaindropListFields = RaindropSpecifiedFields
	public typealias RaindropCreationFields = RaindropCreationSpecifiedFields
	#endif

	public func fetchRaindrop(with id: Dewdrop.Raindrop.ID) async -> SingleResult<RaindropFetchSpecifiedFields> {
		await result {
			try await raindrops.getRaindrop(id: id).item
		}
	}

	public func fetchContents(ofRaindropWith id: Raindrop.ID) async -> SingleResult<Data> {
		await result {
			try await raindrops.getPermanentCopy(ofRaindropWith: id)
		}
	}

	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil, sortedBy sort: Raindrop.Sort? = nil, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Results<RaindropListSpecifiedFields> {
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

	public func findSuggestions(forRaindropCreatedFor url: URL) async -> SingleResult<RaindropSuggestionsFields> {
		await result {
			try await raindrops.suggestCollectionsAndTagsForNewBookmark(link: url.absoluteString).item
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
		media: [Media]? = nil,
		highlightContents: [Highlight.Content]? = nil,
		reminder: Raindrop.Reminder? = nil,
		isFavorite: Bool? = nil,
		creationDate: Date? = nil,
		updateDate: Date? = nil,
		shouldParse: Bool = false
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
				media: media,
				highlights: highlightContents,
				reminder: reminder,
				important: isFavorite,
				created: creationDate,
				lastUpdate: updateDate,
				pleaseParse: shouldParse ? .init() : nil
			).item
		}
	}
}
