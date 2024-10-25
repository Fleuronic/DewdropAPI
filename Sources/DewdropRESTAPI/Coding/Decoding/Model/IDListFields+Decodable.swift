// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Catena.IDListFields
public import struct Identity.Identifier

@AutoDecodable(accessControl: .public)
extension IDListFields: Swift.Decodable where Model.ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case ids
	}
}
