// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import protocol DewdropService.ExportSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: ExportSpec {
	public func exportRaindrops(inCollectionWith id: Collection.ID, as format: Raindrop.Format) async -> SingleResult<Data> {
		await result {
			try await raindropEndpoints.exportInFormat(
				collectionId: id,
				format: format
			)
		}
	}
}
