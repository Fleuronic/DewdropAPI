// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import protocol DewdropService.RaindropSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: RaindropSpec {
	public func fetchRaindrop(with id: Dewdrop.Raindrop.ID) async -> Response<RaindropResponseFields> {
		await response {
			try await raindrops.getRaindrop(id: id).item
		}
	}

	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil/*, sortedBy sort: Raindrop.Sort? = nil*/, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Response<[RaindropResponseFields]> {
		await response {
			try await raindrops.getRaindrops(
				collectionId: id,
				perpage: raindropsPerPage,
				page: page,
				search: query
			).items
		}
	}
}
