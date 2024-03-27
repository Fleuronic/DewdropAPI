// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			fullName: try container.decode(String.self, forKey: .fullName),
			hasProSubscription: try container.decode(Bool.self, forKey: .hasProSubscription)
		)
	}
}

// MARK -
private extension User {
	enum CodingKeys: String, CodingKey {
		case fullName
		case hasProSubscription = "pro"
	}
}
