// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.URL
import struct Foundation.Date

extension Highlight: @retroactive Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			content: .init(
				text: container.decode(String.self, forKey: .text),
				color: container.decodeIfPresent(Highlight.Color.self, forKey: .color) ?? .yellow,
				note: container.decode(String.self, forKey: .note).filledValue
			),
			title: container.decodeIfPresent(String.self, forKey: .title)?.filledValue,
			creationDate: container.decode(Date.self, forKey: .creationDate)
		)
	}
}
