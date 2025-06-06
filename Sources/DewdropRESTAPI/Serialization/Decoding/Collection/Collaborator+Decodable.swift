// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collaborator

@AutoDecodable(accessControl: .public)
extension Collaborator: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case fullName
		case email
		case role
	}
}
