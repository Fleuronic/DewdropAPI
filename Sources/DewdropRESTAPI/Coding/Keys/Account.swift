// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Account

extension Account {
	enum CodingKeys: String, CodingKey {
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
}
