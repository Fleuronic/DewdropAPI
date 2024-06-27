// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightImportFields
import struct Foundation.Date

extension HighlightImportFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			content: .init(
				text: container.decode(String.self, forKey: .text),
				color: container.decode(Highlight.Color.self, forKey: .color),
				note: container.decode(String.self, forKey: .note).filledValue
			),
			creationDate: container.decode(Date.self, forKey: .creationDate)
		)
	}
}
