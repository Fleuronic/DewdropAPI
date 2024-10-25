// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.User
import struct Dewdrop.Collection
public import struct DewdropService.RaindropCreationFields
public import struct DewdropService.TagNameFields

import struct Catena.IDFields

extension RaindropCreationFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(Raindrop.ID.self, forKey: .id),
			owner: container.decode(IDFields<User.Identified>.self, forKey: .owner),
			creator: .init(id: container.decode(User.ID.self, forKey: .creator)),
			collection: container.decode(IDFields<Collection.Identified>.self, forKey: .collection),
			tags: container.decode([TagNameFields].self, forKey: .tags),
			raindrop: .init(from: decoder)
		)
	}
}
