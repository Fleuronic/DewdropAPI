// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightImportFields
import struct Foundation.Date

extension HighlightImportFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			creationDate: try container.decode(Date.self, forKey: .creationDate),
			content: .init(
				text: try container.decode(String.self, forKey: .text),
				color: try container.decode(Highlight.Color.self, forKey: .color),
				note: try container.decode(String.self, forKey: .note).filledValue
			)
		)
	}
}
