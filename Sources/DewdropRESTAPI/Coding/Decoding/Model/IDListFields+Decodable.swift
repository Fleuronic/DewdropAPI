// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Identity.Identifier
import struct Catena.IDListFields

@AutoDecodable(accessControl: .public)
extension IDListFields: Swift.Decodable where Model.ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case ids
	}
}
