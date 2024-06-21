// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import struct DewdropService.IDFields
import struct DewdropService.CollectionDetailsFields

extension CollectionDetailsFields: @retroactive Decodable {
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
