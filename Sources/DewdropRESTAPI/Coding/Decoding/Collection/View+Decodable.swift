// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Collection.View: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case list
		case simple
		case grid
		case masonry
	}
}
