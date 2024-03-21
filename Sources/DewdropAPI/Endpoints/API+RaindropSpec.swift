// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol DewdropService.RaindropSpec
import protocol Catenary.API

extension API: RaindropSpec {
	public func fetchRaindrop(with id: Int) async -> Self.Result<Raindrop> {
		let path = "raindrop/\(id)"
		return await getResource(at: path)
	}
}
