// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Raindrop

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension Raindrop.ItemType: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case link
		case article
		case image
		case video
		case document
		case audio
	}
}
