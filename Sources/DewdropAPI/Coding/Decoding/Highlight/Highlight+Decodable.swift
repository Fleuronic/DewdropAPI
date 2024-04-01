// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightInRaindropFields
import struct Foundation.URL

extension Highlight: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let fields = try HighlightInRaindropFields(from: decoder)

		self = .init(
			text: fields.text,
			color: fields.color,
			note: fields.note,
			title: try container.decode(String.self, forKey: .title).filledValue,
			raindropURL: try container.decode(URL.self, forKey: .raindropURL),
			creationDate: fields.creationDate
		)
	}
}
