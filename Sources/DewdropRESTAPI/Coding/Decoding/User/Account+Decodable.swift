// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Account
import struct Dewdrop.Network
import struct Dewdrop.FileStorage
import struct Foundation.Date

extension Account: @retroactive Decodable {
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

		try self.init(
			user: .init(from: decoder),
			email: container.decode(for: .email),
			hasPassword: container.decode(for: .hasPassword),
			fileStorage: container.decode(for: .fileStorage),
			registrationDate: container.decode(for: .registrationDate),
			proSubscriptionExpirationDate: container.decodeIfPresent(for: .proSubscriptionExpirationDate),
			facebook: container.decodeIfPresent(for: .facebook),
			twitter: container.decodeIfPresent(for: .twitter),
			vkontakte: container.decodeIfPresent(for: .vkontakte),
			google: container.decodeIfPresent(for: .google),
			dropbox: container.decodeIfPresent(for: .dropbox),
			gdrive: container.decodeIfPresent(for: .gdrive)
		)
	}
}
