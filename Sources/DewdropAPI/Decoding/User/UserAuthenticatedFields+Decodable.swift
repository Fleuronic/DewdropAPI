// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Account
import struct DewdropService.ConfigFields
import struct DewdropService.GroupFields
import struct DewdropService.UserAuthenticatedFields

extension UserAuthenticatedFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(User.ID.self, forKey: .id),
			config: try container.decode(ConfigFields.self, forKey: .config),
			groups: try container.decode([GroupFields].self, forKey: .groups),
			account: try .init(from: decoder)
		)
	}
}

private extension UserAuthenticatedFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}
}
