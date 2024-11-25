// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Group

@AutoDecodable(accessControl: .public)
extension Group: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case sortIndex = "sort"
		case isHidden = "hidden"
	}
}
