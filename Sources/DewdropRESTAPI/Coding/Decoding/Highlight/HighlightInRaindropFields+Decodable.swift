// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.Date

extension HighlightInRaindropFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let highlight = try Highlight(from: decoder)
		
		try self.init(
			id: container.decode(for: .id),
			text: highlight.content.text,
			color: highlight.content.color,
			note: highlight.content.note,
			creationDate: highlight.creationDate
		)
	}
}
