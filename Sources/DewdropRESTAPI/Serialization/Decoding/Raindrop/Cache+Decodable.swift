// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Cache

@AutoDecodable(accessControl: .public)
extension Cache: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case status
		@Conditional
		case size
		@Conditional
		case creationDate = "created"
	}
}
