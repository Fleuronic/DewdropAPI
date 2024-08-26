// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension User.Config.BrokenLevel: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case basic
		case `default`
		case strict
		case off
	}
}
