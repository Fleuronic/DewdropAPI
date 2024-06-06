// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User
import struct DewdropService.UserNameFields

@AutoDecodable(accessControl: .public)
extension UserNameFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case name
	}
}
