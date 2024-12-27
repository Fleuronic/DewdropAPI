// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Collection.View: Codable {
	private enum CodingKeys: String, CodingKey {
		case list
		case simple
		case grid
		case masonry
	}
}
