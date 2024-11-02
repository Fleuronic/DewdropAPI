// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Catena.IDFields
import struct Identity.Identifier

@AutoDecodable(accessControl: .public)
extension IDFields: Swift.Decodable where Model.ID: Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}
