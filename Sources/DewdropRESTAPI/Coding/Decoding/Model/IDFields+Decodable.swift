// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Catena.IDFields
public import struct Identity.Identifier

@AutoDecodable(accessControl: .public)
extension IDFields: Swift.Decodable where Model.ID: Decodable {
	enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}
