// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.RaindropFields
import protocol DewdropService.RaindropSpec
import protocol Catenary.API

extension API: RaindropSpec {
	public func fetchRaindrop(with id: Raindrop.ID) async -> Self.Result<RaindropFields> {
		let path = "raindrop/\(id)"
		return await getResource(at: path)
	}
}
