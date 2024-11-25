// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Foundation.Date
import protocol DewdropService.HighlightFields
import protocol Catenary.Details

public struct HighlightInRaindropDetails: HighlightFields {
	public let id: Highlight.ID
	public let text: String
	public let color: Highlight.Color
	public let note: String?
	public let creationDate: Date
	public let updateDate: Date
}

// MARK: -
extension HighlightInRaindropDetails: Details {
	// MARK: Valued
	public typealias Value = Highlight

	// MARK: Representable
	public var value: Value {
		.init(
			content: .init(
				text: text,
				color: color,
				note: note
			),
			title: nil,
			creationDate: creationDate,
			updateDate: updateDate
		)
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let highlight = try Highlight(from: decoder)

		try self.init(
			id: container.decode(for: .id),
			text: highlight.content.text,
			color: highlight.content.color,
			note: highlight.content.note,
			creationDate: highlight.creationDate,
			updateDate: highlight.updateDate
		)
	}
}

// MARK: -
private extension HighlightInRaindropDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
	}
}
