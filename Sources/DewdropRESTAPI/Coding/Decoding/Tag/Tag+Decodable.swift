// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Tag

@AutoDecodable(accessControl: .public)
extension Tag: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case count
	}
}
