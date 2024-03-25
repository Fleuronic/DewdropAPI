// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.IDFields
import struct DewdropService.RaindropDetailsFields
import struct DewdropService.TagNameFields
import struct DewdropService.HighlightInRaindropFields

extension RaindropDetailsFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Raindrop.ID.self, forKey: .id),
			raindrop: try .init(from: decoder),
			collection: try container.decode(IDFields<Collection.Identified>.self, forKey: .collection),
			tags: try container.decode([TagNameFields].self, forKey: .tags),
			highlights: try container.decode([HighlightInRaindropFields].self, forKey: .highlights)
		)
	}
}

private extension RaindropDetailsFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case collection
		case tags
		case highlights
	}
}
