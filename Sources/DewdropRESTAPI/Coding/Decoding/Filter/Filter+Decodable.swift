// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.Filter

@AutoDecodable(accessControl: .public)
extension Filter: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case count
	}
}
