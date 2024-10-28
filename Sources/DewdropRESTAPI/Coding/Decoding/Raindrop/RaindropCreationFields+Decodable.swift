// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.User
import struct Dewdrop.Collection
import struct DewdropService.RaindropCreationFields
import struct DewdropService.TagNameFields
import struct Catena.IDFields

extension RaindropCreationFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			owner: container.decode(for: .owner),
			creator: .init(id: container.decode(for: .creator)),
			collection: container.decode(for: .collection),
			tags: container.decode(for: .tags),
			raindrop: .init(from: decoder)
		)
	}
}
