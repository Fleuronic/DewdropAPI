// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Account

extension Account: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			email: try container.decode(String.self, forKey: .email)
		)
	}
}

// MARK -
private extension Account {
	enum CodingKeys: String, CodingKey {
		case email
	}
}
