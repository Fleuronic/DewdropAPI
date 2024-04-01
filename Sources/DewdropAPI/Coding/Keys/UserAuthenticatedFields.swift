// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.UserAuthenticatedFields

extension UserAuthenticatedFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}
}
