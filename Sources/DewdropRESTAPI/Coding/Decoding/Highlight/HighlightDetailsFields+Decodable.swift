// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Highlight
import struct DewdropService.HighlightDetailsFields
import struct Foundation.Date

extension HighlightDetailsFields: @retroactive Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case raindropID = "raindropRef"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			raindropID: container.decode(for: .raindropID),
			highlight: .init(from: decoder)
		)
	}
}
