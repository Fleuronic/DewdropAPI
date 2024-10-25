// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.Collaborator

@AutoDecodable(accessControl: .public)
extension Collaborator: Swift.Decodable {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case role
	}
}
