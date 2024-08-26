// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import struct DewdropService.ModelFields
import struct Identity.Identifier

extension ModelFields: Swift.Decodable where Model: Decodable, ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			model: .init(from: decoder)
		)
	}
}
