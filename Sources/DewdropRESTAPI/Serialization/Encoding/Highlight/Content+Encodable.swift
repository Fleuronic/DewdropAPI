// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Highlight
import struct DewdropService.IdentifiedHighlight

@AutoEncodable(accessControl: .public)
extension Highlight.Content: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
	}
}

// MARK: -
extension Highlight.Content.Identified: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case text
		case color
		case note
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		try container.encode(id, forKey: .id)
		try container.encode(content.text, forKey: .text)
		try container.encode(content.color, forKey: .color)
		try container.encode(content.note, forKey: .note)
	}
}
