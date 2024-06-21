// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Group

@AutoDecodable(accessControl: .public)
extension Group: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case isHidden = "hidden"
		case sortIndex = "sort"
	}
}
