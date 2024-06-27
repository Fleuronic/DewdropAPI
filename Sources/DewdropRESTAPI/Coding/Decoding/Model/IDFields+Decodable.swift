// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Identity.Identifier
import struct Catena.IDFields

@AutoDecodable(accessControl: .public)
extension IDFields: Decodable where Model.ID: Decodable {
	enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}
