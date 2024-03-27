// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator

extension Collaborator: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			email: try container.decode(String.self, forKey: .email),
			fullName: try container.decode(String.self, forKey: .fullName),
			role: try container.decode(Role.self, forKey: .role)
		)
	}
}

// MARK -
private extension Collaborator {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case role
	}
}
