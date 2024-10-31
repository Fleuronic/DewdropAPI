// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import protocol DewdropService.RaindropSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: RaindropSpec {
	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil/*, sortedBy sort: Raindrop.Sort? = nil*/, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Response<[RaindropListFields]> {
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
