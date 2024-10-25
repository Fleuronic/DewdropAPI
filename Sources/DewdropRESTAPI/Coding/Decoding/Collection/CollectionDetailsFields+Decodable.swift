// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.CollectionDetailsFields

extension CollectionDetailsFields: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			id: container.decode(for: .id),
			parent: container.decodeIfPresent(for: .parent),
			owner: container.decode(for: .owner),
			collection: .init(from: decoder)
		)
	}
}
