// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import protocol DewdropService.CollectionFields
import protocol Catenary.Fields

public struct CollectionCountFields: CollectionFields {
	public let id: Collection.ID
	public let count: Int
}

// MARK: -
extension CollectionCountFields: Fields {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: Collection.CodingKeys.self)
		let detailsContainer = try decoder.container(keyedBy: CollectionDetails.CodingKeys.self)

		try self.init(
			id: detailsContainer.decode(for: .id),
			count: container.decode(for: .count)
		)
	}
}
