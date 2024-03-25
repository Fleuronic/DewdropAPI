// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightListFields
import struct DewdropService.HighlightListFields
import protocol DewdropService.HighlightSpec
import protocol Catenary.API

extension API: HighlightSpec {
	public func listHighlights(inCollectionWith id: Collection.ID? = nil) async -> Self.Result<[HighlightListFields]> {
		let collectionPath = id.map { "/\($0)" } ?? .init()
		let path = "highlights" + collectionPath
		return await getResource(at: path)
	}
	
	public func fetchRaindropHighlights(with id: Raindrop.ID) async -> Self.Result<RaindropHighlightListFields> {
		let path = "raindrop/\(id)"
		let result: Self.Result<RaindropDetailsFields> = await getResource(at: path)
		return result.map(RaindropHighlightListFields.init)
	}
}
