// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserNameFields

extension UserNameFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(User.ID.self, forKey: .id),
			name: try container.decode(String.self, forKey: .name)
		)
	}
}
