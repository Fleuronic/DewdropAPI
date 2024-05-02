// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropImportFields
import struct DewdropService.TagNameFields
import struct DewdropService.HighlightImportFields

extension RaindropImportFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			tags: try container.decode([TagNameFields].self, forKey: .tags),
			highlights: try container.decodeIfPresent([HighlightImportFields].self, forKey: .highlights)
		)
	}
}
