// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.Media

@AutoDecodable(accessControl: .public)
@AutoEncodable(accessControl: .public)
extension Media: Codable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
	}
}
