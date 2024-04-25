// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropFields
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightsFields
import struct DewdropService.RaindropSuggestionListFields
import struct Foundation.URL
import struct Foundation.Data
import protocol DewdropService.RaindropSpec
import protocol Catenary.API

extension API: RaindropSpec {
	public func listRaindrops(inCollectionWith id: Collection.ID, searchingFor search: String? = nil, sortedBy sort: Raindrop.Sort? = nil, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Self.Result<[RaindropFields]> {
		let path = "raindrops/\(id)"
		let parameters = RaindropListParameters(
			sort: sort,
			page: page,
			raindropsPerPage: raindropsPerPage,
			search: search
		)
		
		return await getResource(at: path, with: parameters)
	}
	
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
	
	public func listSuggestionsForNewRaindrop(with url: URL) async -> Self.Result<RaindropSuggestionListFields> {
		let path = "raindrop/suggest"
		let payload = RaindropSuggestionPayload(url: url)
		return await post(payload, to: path)
	}
	
	public func downloadPermanentCopy(ofRaindropWith id: Raindrop.ID) async -> Self.Result<Data> {
		let path = "raindrop/\(id)/cache"
		return await getResource(at: path)
	}
	
	public func removeRaindrop(with id: Raindrop.ID) async -> Self.Result<Void> {
		let path = "raindrop/\(id)"
		return await deleteResource(at: path)
	}
	
	public func removeRaindrops(fromCollectionWith id: Collection.ID? = nil, matching ids: [Raindrop.ID]? = nil, searchingFor search: String? = nil) async -> Self.Result<Void> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "raindrops" + collectionPath
		let parameters = RaindropParameters(search: search)
		
		return await ids.asyncMap { ids in
			let payload = RaindropRemovalPayload(ids: ids)
			return await deleteResource(at: path, using: payload, with: parameters)
		}.asyncMapNil { 
			await deleteResource(at: path, with: parameters)
		}
	}
}
