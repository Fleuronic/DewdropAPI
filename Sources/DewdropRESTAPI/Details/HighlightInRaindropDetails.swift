// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Foundation.Date
import protocol DewdropService.HighlightFields

public struct HighlightInRaindropDetails: HighlightFields {
	public let id: Highlight.ID
	public let text: String
	public let color: Highlight.Color
	public let note: String?
	public let creationDate: Date
}

extension HighlightInRaindropDetails: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	public init(from decoder: any Decoder) throws {
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
