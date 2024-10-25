// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Cache

extension Cache: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			status: try container.decode(for: .status),
			size: try container.decodeIfPresent(for: .size),
			creationDate: try container.decodeIfPresent(for: .creationDate)
		)
	}
}
