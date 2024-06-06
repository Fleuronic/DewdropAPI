// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoDecodable(accessControl: .public)
extension User: Decodable {
	enum CodingKeys: String, CodingKey {
		case fullName
		case hasProSubscription = "pro"
	}
}
