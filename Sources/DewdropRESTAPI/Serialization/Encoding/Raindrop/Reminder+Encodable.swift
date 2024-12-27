// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Raindrop

@AutoEncodable(accessControl: .public)
extension Raindrop.Reminder: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case date
	}
}
