// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.UserAuthenticatedDetailsFields

extension UserAuthenticatedDetailsFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}
}
