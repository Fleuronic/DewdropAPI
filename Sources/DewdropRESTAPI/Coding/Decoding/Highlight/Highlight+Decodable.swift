// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.URL
import struct Foundation.Date

extension Highlight: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			content: .init(
				text: try container.decode(String.self, forKey: .text),
				color: try container.decodeIfPresent(Highlight.Color.self, forKey: .color) ?? .yellow,
				note: try container.decode(String.self, forKey: .note).filledValue
			),
			title: try container.decode(String.self, forKey: .title).filledValue,
			raindropURL: try container.decode(URL.self, forKey: .raindropURL),
			creationDate: try container.decode(Date.self, forKey: .creationDate)
		)
	}
}
