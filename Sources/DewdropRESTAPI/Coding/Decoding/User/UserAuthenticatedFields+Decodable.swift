// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Account
import struct DewdropService.ConfigFields
import struct DewdropService.GroupFields
import struct DewdropService.UserAuthenticatedDetailsFields

extension UserAuthenticatedDetailsFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			id: container.decode(for: .id),
			config: container.decode(for: .config),
			groups: container.decode(for: .groups),
			account: .init(from: decoder)
		)
	}
}
