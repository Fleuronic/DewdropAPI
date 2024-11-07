// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collaborator

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Collaborator.Role: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case owner
		case member
		case viewer
	}
}
