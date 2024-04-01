// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.Date

extension HighlightInRaindropFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Highlight.ID.self, forKey: .id),
			text: try container.decode(String.self, forKey: .text),
			color: try container.decodeIfPresent(Highlight.Color.self, forKey: .color) ?? .yellow,
			note: try container.decode(String.self, forKey: .note).filledValue,
			creationDate: try container.decode(Date.self, forKey: .creationDate)
		)
	}
}
