// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Cache
import struct Foundation.Date

extension Cache: @retroactive Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			status: try container.decode(Status.self, forKey: .status),
			size: try container.decodeIfPresent(Int.self, forKey: .size),
			creationDate: try container.decodeIfPresent(Date.self, forKey: .creationDate)
		)
	}
}
