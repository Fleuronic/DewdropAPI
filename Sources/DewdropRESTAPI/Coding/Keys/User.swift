// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User {
	enum CodingKeys: String, CodingKey {
		case fullName
		case hasProSubscription = "pro"
	}
}
