// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import protocol Catenary.Fields

public struct CollectionRemovalFields {
	public let ids: [Collection.ID]
	public let count: Int
}

// MARK: -
extension CollectionRemovalFields: Fields {
	// MARK: Fields
	public typealias Model = Collection

	// MARK: Decodable
	private enum CodingKeys: String, CodingKey {
		case ids
		case count = "modified"
	}
}
