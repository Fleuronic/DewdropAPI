// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.CollaboratorEmailListFields

@AutoDecodable(accessControl: .public)
extension CollaboratorEmailListFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case emails
	}
}
