// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Highlight
import struct DewdropService.IDFields
import struct DewdropService.HighlightFields
import struct Foundation.Date

extension HighlightFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Highlight.ID.self, forKey: .id),
			raindropID: try container.decode(Raindrop.ID.self, forKey: .raindropID),
			highlight: try .init(from: decoder)
		)
	}
}
