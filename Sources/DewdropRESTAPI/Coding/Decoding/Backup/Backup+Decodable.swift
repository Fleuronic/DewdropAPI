// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Backup
import struct Foundation.Date

@AutoDecodable(accessControl: .public) 
extension Backup: Decodable {
	private enum CodingKeys: String, CodingKey {
		case creationDate = "created"
	}
}
