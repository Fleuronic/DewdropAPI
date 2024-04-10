// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.RaindropFields

extension RaindropFields: Decodable {
	public init(from decoder: Decoder) throws {
		self = .init(try .init(from: decoder))
	}
}
