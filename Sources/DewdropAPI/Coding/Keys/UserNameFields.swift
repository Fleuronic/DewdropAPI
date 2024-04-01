// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.UserNameFields

extension UserNameFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case name
	}
}
