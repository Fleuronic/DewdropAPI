// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropService.CollectionDetailsFields
import struct Catena.IDFields

extension CollectionDetailsFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			id: container.decode(for: .id),
			owner: container.decode(for: .owner),
			parent: container.decodeIfPresent(for: .parent),
			collection: .init(from: decoder)
		)
	}
}
