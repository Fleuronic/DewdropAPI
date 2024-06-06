// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropService.IDFields
import struct DewdropService.CollectionDetailsFields

extension CollectionDetailsFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			id: try container.decode(for: .id),
			owner: try container.decode(for: .owner),
			parent: try container.decodeIfPresent(for: .parent),
			collection: try .init(from: decoder)
		)
	}
}
