// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.CollaboratorRoleFields

@AutoDecodable(accessControl: .public)
extension CollaboratorRoleFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case role
	}
}
