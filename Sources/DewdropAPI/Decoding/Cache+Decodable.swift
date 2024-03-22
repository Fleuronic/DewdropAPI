// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Cache
import struct Foundation.Date

extension Cache: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			status: try container.decode(Status.self, forKey: .status),
			size: try container.decode(Int.self, forKey: .size),
			creationDate: try! container.decode(Date.self, forKey: .creationDate)
		)
	}
}

// MARK -
private extension Cache {
	enum CodingKeys: String, CodingKey {
		case status
		case size
		case creationDate = "created"
	}
}
