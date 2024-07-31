// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Filter

@AutoDecodable(accessControl: .public)
extension Filter: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case count
	}
}
