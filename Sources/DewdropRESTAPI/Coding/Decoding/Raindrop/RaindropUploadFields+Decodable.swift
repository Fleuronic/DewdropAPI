// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.User
import struct Dewdrop.Collection
import struct DewdropService.IDFields
import struct DewdropService.RaindropCreationFields
import struct DewdropService.TagNameFields

extension RaindropCreationFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(Raindrop.ID.self, forKey: .id),
			raindrop: .init(from: decoder),
			owner: container.decode(IDFields<User.Identified>.self, forKey: .owner),
			creator: .init(id: container.decode(User.ID.self, forKey: .creator)),
			collection: container.decode(IDFields<Collection.Identified>.self, forKey: .collection),
			tags: container.decode([TagNameFields].self, forKey: .tags)
		)
	}
}
