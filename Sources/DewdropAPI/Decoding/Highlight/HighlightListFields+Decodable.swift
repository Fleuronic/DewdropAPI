// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct DewdropService.HighlightListFields

extension HighlightListFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Highlight.ID.self, forKey: .id),
			highlight: try Highlight(from: decoder)
		)
	}
}

private extension HighlightListFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
	}
}
