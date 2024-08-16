// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightImportFields
import struct Foundation.Date

extension HighlightImportFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
		case creationDate = "created"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			content: .init(
				text: container.decode(for: .text),
				color: container.decode(for: .color),
				note: container.decode(String.self, forKey: .note).filledValue
			),
			creationDate: container.decode(for: .creationDate)
		)
	}
}
