// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import protocol DewdropService.CollectionFields

public struct CollectionCountFields: CollectionFields {
	public let id: Collection.ID
	public let count: Int
}

// MARK: -
extension CollectionCountFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case count
	}
}
