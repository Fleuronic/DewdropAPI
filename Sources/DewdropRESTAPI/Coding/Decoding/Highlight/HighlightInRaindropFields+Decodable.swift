// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.HighlightInRaindropFields
public import struct Dewdrop.Highlight

extension HighlightInRaindropFields: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
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
