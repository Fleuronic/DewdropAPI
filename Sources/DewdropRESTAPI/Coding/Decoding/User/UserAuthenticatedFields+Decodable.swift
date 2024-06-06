// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Account
import struct DewdropService.ConfigFields
import struct DewdropService.GroupFields
import struct DewdropService.UserAuthenticatedDetailsFields

extension UserAuthenticatedDetailsFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			id: try container.decode(for: .id),
			config: try container.decode(for: .config),
			groups: try container.decode(for: .groups),
			account: try .init(from: decoder)
		)
	}
}
