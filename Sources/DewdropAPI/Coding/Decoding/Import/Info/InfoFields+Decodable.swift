// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.InfoFields
import struct DewdropService.MetaFields

extension InfoFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			info: try .init(from: decoder),
			meta: try container.decode(MetaFields.self, forKey: .meta)
		)
	}
}
