// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media
import struct Foundation.URL

@AutoDecodable(accessControl: .public)
extension Media: Decodable {
	private enum CodingKeys: String, CodingKey {
		case url
	}
}
