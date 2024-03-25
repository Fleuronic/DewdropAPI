// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct DewdropService.TagListFields

extension TagListFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Tag.ID.self, forKey: .id),
			tag: try .init(from: decoder)
		)
	}
}

private extension TagListFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
	}
}
