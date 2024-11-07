// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropDetailsFields

extension RaindropDetailsFields: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case creator = "creatorRef"
		case collection
		case tags
		case highlights
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			owner: container.decode(for: .owner),
			creator: container.decode(for: .creator),
			collection: container.decode(for: .collection),
			tags: container.decode(for: .tags),
			highlights: container.decodeIfPresent(for: .highlights),
			raindrop: .init(from: decoder)
		)
	}
}
