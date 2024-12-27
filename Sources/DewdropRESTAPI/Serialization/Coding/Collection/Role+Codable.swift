// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collaborator

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Collaborator.Role: Codable {
	private enum CodingKeys: String, CodingKey {
		case owner
		case member
		case viewer
	}
}
