// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.IDFields
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.Date

extension HighlightInRaindropFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: IDFields<Highlight.Identified>.CodingKeys.self)
		let highlight = try Highlight(from: decoder)
		
		try self.init(
			id: container.decode(Highlight.ID.self, forKey: .id),
			text: highlight.content.text,
			color: highlight.content.color,
			note: highlight.content.note,
			creationDate: highlight.creationDate
		)
	}
}
