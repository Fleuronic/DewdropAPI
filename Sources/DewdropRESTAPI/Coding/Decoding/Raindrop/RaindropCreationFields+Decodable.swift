// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Raindrop
public import struct Dewdrop.User
public import struct Dewdrop.Collection
public import struct DewdropService.RaindropCreationFields
public import struct DewdropService.TagNameFields
public import struct Catena.IDFields

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
