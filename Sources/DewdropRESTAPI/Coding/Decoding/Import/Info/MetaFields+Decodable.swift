// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.MetaFields
import struct DewdropService.TagNameFields

extension MetaFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			tags: try container.decode([TagNameFields].self, forKey: .tags)
		)
	}
}
