// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media

@AutoDecodable(accessControl: .public)
@AutoEncodable(accessControl: .public)
extension Media: Swift.Codable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
		@Conditional case type
	}
}
