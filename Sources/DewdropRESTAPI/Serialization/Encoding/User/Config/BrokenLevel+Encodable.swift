// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension User.Config.BrokenLevel: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case basic
		case `default`
		case strict
		case off
	}
}
