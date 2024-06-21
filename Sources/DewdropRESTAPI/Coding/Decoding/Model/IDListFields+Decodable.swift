// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Identity.Identifier
import struct DewdropService.IDListFields

@AutoDecodable(accessControl: .public)
extension IDListFields: @retroactive Decodable where Model.ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case ids
	}
}
