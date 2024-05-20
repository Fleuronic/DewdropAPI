// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media

@AutoEncodable(accessControl: .public)
extension Media: Encodable {
	private enum CodingKeys: String, CodingKey {
		case url
	}
}
