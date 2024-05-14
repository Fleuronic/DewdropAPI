// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.MetaFields

@AutoDecodable(accessControl: .public)
extension MetaFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case tags
	}
}