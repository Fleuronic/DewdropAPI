// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropService.IDFields
import struct DewdropService.CollectionDetailsFields

extension CollectionDetailsFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Collection.ID.self, forKey: .id),
			owner: try container.decode(IDFields<User.Identified>.self, forKey: .owner),
			parent: try container.decodeIfPresent(IDFields<Collection.Identified>.self, forKey: .parent),
			collection: try .init(from: decoder)
		)
	}
}

private extension CollectionDetailsFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}
}
