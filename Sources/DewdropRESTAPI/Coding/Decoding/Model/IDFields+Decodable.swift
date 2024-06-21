// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Identity.Identifier
import struct DewdropService.IDFields

@AutoDecodable(accessControl: .public)
extension IDFields: @retroactive Decodable where Model.ID: Decodable {
	enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}
