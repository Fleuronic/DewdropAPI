// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.Network

@AutoDecodable(accessControl: .public)
extension Network: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case isEnabled = "enabled"
	}
}
