// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.User
import struct Dewdrop.Collection
import struct DewdropService.IDFields
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.UserNameFields
import struct DewdropService.TagNameFields
import struct DewdropService.HighlightInRaindropFields

extension RaindropDetailsFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(Raindrop.ID.self, forKey: .id),
			raindrop: .init(from: decoder),
			owner: container.decode(IDFields<User.Identified>.self, forKey: .owner),
			creator: container.decode(UserNameFields.self, forKey: .creator),
			collection: container.decode(IDFields<Collection.Identified>.self, forKey: .collection),
			tags: container.decode([TagNameFields].self, forKey: .tags),
			highlights: container.decodeIfPresent([HighlightInRaindropFields].self, forKey: .highlights)
		)
	}
}
