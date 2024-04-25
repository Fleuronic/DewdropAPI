// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct DewdropService.ModelFields
import struct Identity.Identifier

extension ModelFields: Decodable where Model: Decodable, ID: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(ID.self, forKey: .id),
			model: try .init(from: decoder)
		)
	}
}
