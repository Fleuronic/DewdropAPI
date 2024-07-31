// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoDecodable(accessControl: .public)
extension User: @retroactive Decodable {
	enum CodingKeys: String, CodingKey {
		case fullName
		case hasProSubscription = "pro"
	}
}
