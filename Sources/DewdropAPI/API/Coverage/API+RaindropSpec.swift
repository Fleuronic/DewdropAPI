// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.PendingIdentifier
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.Media
import struct Dewdrop.Highlight
import struct DewdropRESTAPI.RaindropSuggestionsFields
import struct DewdropRESTAPI.RaindropModificationFields
import struct Foundation.URL
import struct Foundation.Date
import struct Foundation.Data
import protocol DewdropService.RaindropSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: RaindropSpec {
	#if swift(<6.0)
	public typealias RaindropFetchFields = RaindropFetchSpecifiedFields
	public typealias RaindropListFields = RaindropListSpecifiedFields
	public typealias RaindropCreationFields = RaindropSpecifiedFields
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

	public func createRaindrop(_ id: Raindrop.PendingID = .fromServer, for url: URL, with parameters: Raindrop.CreationParameters = .init()) async -> SingleResult<RaindropSpecifiedFields> {
		await result {
			try await raindrops.createRaindrop(
				link: url.absoluteString,
				title: parameters.title,
				type: parameters.itemType,
				excerpt: parameters.excerpt,
				cover: parameters.coverURL,
				order: parameters.order,
				collectionId: parameters.collectionID,
				tags: parameters.tagNames,
				media: parameters.media,
				highlights: parameters.highlightContents,
				reminder: parameters.reminder,
				important: parameters.isFavorite,
				created: parameters.creationDate,
				lastUpdate: parameters.updateDate,
				pleaseParse: parameters.shouldParse ? .init() : nil
			).item
		}
	}

	public func createRaindrops(_ ids: [Raindrop.PendingID] = [.fromServer], for urls: [URL], with parameters: [Raindrop.CreationParameters]) async -> Results<RaindropSpecifiedFields> {
		await results {
			try await raindrops.createRaindrops(
				items: zip(urls, parameters).map { url, parameters in
					.init(
						link: url.absoluteString,
						title: parameters.title,
						type: parameters.itemType,
						excerpt: parameters.excerpt,
						cover: parameters.coverURL,
						order: parameters.order,
						collectionId: parameters.collectionID,
						tags: parameters.tagNames,
						media: parameters.media,
						highlights: parameters.highlightContents,
						reminder: parameters.reminder,
						important: parameters.isFavorite,
						created: parameters.creationDate,
						lastUpdate: parameters.updateDate,
						pleaseParse: parameters.shouldParse ? .init() : nil
					)
				}
			).items
		}
	}

	public func updateRaindrop(with id: Raindrop.ID, to url: URL?, updating parameters: Raindrop.CreationParameters = .init()) async -> SingleResult<RaindropSpecifiedFields /* TODO */> {
		await result {
			try await raindrops.updateRaindrop(
				id: id,
				link: url?.absoluteString,
				title: parameters.title,
				type: parameters.itemType,
				excerpt: parameters.excerpt,
				cover: parameters.coverURL,
				order: parameters.order,
				collectionId: parameters.collectionID,
				tags: parameters.tagNames,
				media: parameters.media,
				highlights: parameters.highlightContents,
				reminder: parameters.reminder,
				important: parameters.isFavorite,
				created: parameters.creationDate,
				lastUpdate: parameters.updateDate,
				pleaseParse: parameters.shouldParse ? .init() : nil
			).item
		}
	}

	public func updateRaindrops(with ids: [Raindrop.ID], inCollectionWith collectionID: Collection.ID = .all, searchingFor query: String? = nil, updating parameters: Raindrop.UpdateParameters) async -> SingleResult<RaindropModificationFields> {
		await result {
			try await raindrops.updateRaindrops(
				ids: ids,
				search: query,
				collectionId: collectionID,
				cover: parameters.coverURL,
				tags: parameters.tagNames,
				media: parameters.media,
				important: parameters.isFavorite
			)
		}
	}

	public func uploadCover(forRaindropWith id: Raindrop.ID, usingFileAt url: URL) async -> SingleResult<RaindropFetchSpecifiedFields> {
		await result {
			try await raindrops.uploadCover(
				id: id,
				cover: .init(
					data: .init(contentsOf: url),
					fileName: "cover"
				)
			).item
		}
	}

	public func findSuggestions(forRaindropWith id: Raindrop.ID) async -> SingleResult<RaindropSuggestionsFields> {
		await result {
			try await raindrops.suggestCollectionsAndTagsForExistingBookmark(id: id).item
		}
	}

	public func findSuggestions(forRaindropWith id: Raindrop.PendingID = .fromServer, createdFor url: URL) async -> SingleResult<RaindropSuggestionsFields> {
		await result {
			try await raindrops.suggestCollectionsAndTagsForNewBookmark(link: url.absoluteString).item
		}
	}

	public func removeRaindrop(with id: Raindrop.ID) async -> SuccessResult {
		await result {
			try await raindrops.removeRaindrop(id: id).result
		}
	}

	public func removeRaindrops(fromCollectionWith collectionID: Collection.ID, matching ids: [Raindrop.ID]? = nil, searchingFor search: String? = nil) async -> SingleResult<RaindropModificationFields> {
		await result {
			try await raindrops.removeRaindrops(
				collectionId: collectionID,
				ids: ids,
				search: search
			)
		}
	}
}
