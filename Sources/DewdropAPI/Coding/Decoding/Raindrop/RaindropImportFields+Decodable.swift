// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropImportFields
import struct DewdropService.TagNameFields
import struct DewdropService.HighlightInRaindropFields

extension RaindropImportFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			tags: try container.decode([TagNameFields].self, forKey: .tags),
			highlights: try container.decode([HighlightInRaindropFields].self, forKey: .highlights)
		)
	}
}
