// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Collection
public import struct DewdropService.RaindropDetailsFields
public import protocol DewdropService.RaindropSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

extension API: RaindropSpec {
	public func listRaindrops(inCollectionWith id: Collection.ID = .all, searchingFor query: String? = nil/*, sortedBy sort: Raindrop.Sort? = nil*/, onPage page: Int? = nil, listing raindropsPerPage: Int? = nil) async -> Self.Result<[RaindropListFields]> {
		await result {
			try await raindrops.getRaindrops(
				collectionId: id,
				perpage: raindropsPerPage,
				page: page,
				search: query
			).items
		}
	}
}
