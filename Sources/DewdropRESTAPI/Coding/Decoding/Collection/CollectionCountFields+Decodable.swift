// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields

@AutoDecodable(accessControl: .public)
extension CollectionCountFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case count
	}
}
