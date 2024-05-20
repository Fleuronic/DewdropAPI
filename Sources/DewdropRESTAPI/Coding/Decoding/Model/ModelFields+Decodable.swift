// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct DewdropService.ModelFields
import struct Identity.Identifier

extension ModelFields: Decodable where Model: Decodable, ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(for: .id),
			model: try .init(from: decoder)
		)
	}
}
