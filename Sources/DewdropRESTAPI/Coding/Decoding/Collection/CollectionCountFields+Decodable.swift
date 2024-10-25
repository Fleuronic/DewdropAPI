// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct DewdropService.CollectionCountFields

@AutoDecodable(accessControl: .public)
extension CollectionCountFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case count
	}
}
