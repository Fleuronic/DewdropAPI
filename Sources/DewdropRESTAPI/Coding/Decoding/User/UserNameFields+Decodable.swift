// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct DewdropService.UserNameFields

@AutoDecodable(accessControl: .public)
extension UserNameFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case name
	}
}
