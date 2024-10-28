// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Backup

@AutoDecodable(accessControl: .public) 
extension Backup: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case creationDate = "created"
	}
}
