// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IDFields
import struct DewdropService.CollectionListFields

extension CollectionListFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Collection.ID.self, forKey: .id),
			parent: try container.decodeIfPresent(IDFields<Collection.Identified>.self, forKey: .parent),
			collection: try .init(from: decoder)
		)
	}
}

private extension CollectionListFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case parent
	}
}
