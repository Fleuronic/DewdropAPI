// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Foundation.URL
import struct Foundation.Date

extension Highlight: @retroactive Decodable {
	public enum CodingKeys: String, CodingKey {
		case title
		case text
		case color
		case note
		case raindropURL = "link"
		case creationDate = "created"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			content: .init(
				text: container.decode(for: .text),
				color: container.decodeIfPresent(for: .color) ?? .yellow,
				note: container.decode(String.self, forKey: .note).filledValue
			),
			title: container.decodeIfPresent(String.self, forKey: .title)?.filledValue,
			creationDate: container.decode(for: .creationDate)
		)
	}
}
