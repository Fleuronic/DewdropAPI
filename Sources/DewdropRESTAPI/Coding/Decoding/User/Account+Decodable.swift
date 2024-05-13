// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Account
import struct Dewdrop.Network
import struct Dewdrop.FileStorage
import struct Foundation.Date

extension Account: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			user: try .init(from: decoder),
			email: try container.decode(String.self, forKey: .email),
			hasPassword: try container.decode(Bool.self, forKey: .hasPassword),
			fileStorage: try container.decode(FileStorage.self, forKey: .fileStorage),
			registrationDate: try container.decode(Date.self, forKey: .registrationDate),
			proSubscriptionExpirationDate: try container.decodeIfPresent(Date.self, forKey: .proSubscriptionExpirationDate),
			facebook: try container.decodeIfPresent(Network.self, forKey: .facebook),
			twitter: try container.decodeIfPresent(Network.self, forKey: .twitter),
			vkontakte: try container.decodeIfPresent(Network.self, forKey: .vkontakte),
			google: try container.decodeIfPresent(Network.self, forKey: .google),
			dropbox: try container.decodeIfPresent(Network.self, forKey: .dropbox),
			gdrive: try container.decodeIfPresent(Network.self, forKey: .gdrive)
		)
	}
}
