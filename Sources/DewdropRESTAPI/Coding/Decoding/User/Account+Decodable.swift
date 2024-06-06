// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Account
import struct Dewdrop.Network
import struct Dewdrop.FileStorage
import struct Foundation.Date

extension Account: Decodable {
	private enum CodingKeys: String, CodingKey {
		case email
		case hasPassword = "password"
		case fileStorage = "files"
		case registrationDate = "registered"
		case proSubscriptionExpirationDate = "proExpire"
		case facebook
		case twitter
		case vkontakte
		case google
		case dropbox
		case gdrive
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			user: try .init(from: decoder),
			email: try container.decode(for: .email),
			hasPassword: try container.decode(for: .hasPassword),
			fileStorage: try container.decode(for: .fileStorage),
			registrationDate: try container.decode(for: .registrationDate),
			proSubscriptionExpirationDate: try container.decodeIfPresent(for: .proSubscriptionExpirationDate),
			facebook: try container.decodeIfPresent(for: .facebook),
			twitter: try container.decodeIfPresent(for: .twitter),
			vkontakte: try container.decodeIfPresent(for: .vkontakte),
			google: try container.decodeIfPresent(for: .google),
			dropbox: try container.decodeIfPresent(for: .dropbox),
			gdrive: try container.decodeIfPresent(for: .gdrive)
		)
	}
}
