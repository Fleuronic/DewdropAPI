// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collaborator

@AutoDecodable(accessControl: .public)
extension Collaborator: @retroactive Decodable {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case role
	}
}
