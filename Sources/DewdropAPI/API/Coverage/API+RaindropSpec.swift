// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import protocol DewdropService.RaindropSpec
import protocol Catenary.API

extension API: RaindropSpec {
	public typealias RaindropListFields = RaindropDetailsFields
	
	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor search: String? = nil/*, sortedBy sort: Raindrop.Sort? = nil*/, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Self.Result<[RaindropListFields]> {
		await result {
			try await raindrops.getRaindrops(
				collectionId: id,
				perpage: raindropsPerPage,
				page: page,
				search: search
			).items
		}
	}
}
