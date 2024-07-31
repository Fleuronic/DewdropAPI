// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Highlight
import struct DewdropService.HighlightFields
import struct Foundation.Date

extension HighlightFields: @retroactive Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(Highlight.ID.self, forKey: .id),
			raindropID: container.decode(Raindrop.ID.self, forKey: .raindropID),
			highlight: .init(from: decoder)
		)
	}
}
