// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection

@AutoDecodable(accessControl: .public)
extension Collection.Cover: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case icons
	}
}
