// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension Media.MediaType: Codable {
	private enum CodingKeys: String, CodingKey {
		case image
	}
}
