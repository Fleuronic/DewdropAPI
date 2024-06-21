// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Network

@AutoDecodable(accessControl: .public)
extension Network: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case isEnabled = "enabled"
	}
}
