// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.FileStorage
import struct Foundation.Date

@AutoDecodable(accessControl: .public)
extension FileStorage: Decodable {
	enum CodingKeys: String, CodingKey {
		case usedSpace = "used"
		case totalSpace = "size"
		case lastCheckpointDate = "lastCheckPoint"
	}
}
