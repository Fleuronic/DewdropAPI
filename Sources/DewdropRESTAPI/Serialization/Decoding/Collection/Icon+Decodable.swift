// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection

@AutoDecodable(accessControl: .public)
extension Collection.Cover.Icon: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		@Conditional
		case png
		@Conditional
		case svg
	}
}
