// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media
import struct Foundation.URL

@AutoDecodable(accessControl: .public)
@AutoEncodable(accessControl: .public)
extension Media: Codable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
	}
}
