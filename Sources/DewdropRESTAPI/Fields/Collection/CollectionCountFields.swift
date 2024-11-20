// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import protocol DewdropService.CollectionFields
import protocol Catenary.Fields

public struct CollectionCountFields: CollectionFields, Fields {
	public let id: Collection.ID
	public let count: Int
}

// MARK: -
private extension CollectionCountFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case count
	}
}
