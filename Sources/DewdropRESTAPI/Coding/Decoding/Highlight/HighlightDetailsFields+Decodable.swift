// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.HighlightDetailsFields

extension HighlightDetailsFields: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case raindropID = "raindropRef"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			raindropID: container.decode(for: .raindropID),
			highlight: .init(from: decoder)
		)
	}
}
