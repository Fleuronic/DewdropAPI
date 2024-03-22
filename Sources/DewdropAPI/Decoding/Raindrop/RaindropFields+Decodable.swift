// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.RaindropFields
import struct DewdropService.RaindropCollectionFields

extension RaindropFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Raindrop.ID.self, forKey: .id),
			raindrop: try Raindrop(from: decoder),
			collection: try container.decode(RaindropCollectionFields.self, forKey: .collection)
		)
	}
}

private extension RaindropFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case collection
	}
}
