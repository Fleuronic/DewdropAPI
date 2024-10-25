// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.FileStorage

@AutoDecodable(accessControl: .public)
extension FileStorage: Swift.Decodable {
	enum CodingKeys: String, CodingKey {
		case usedSpace = "used"
		case totalSpace = "size"
		case lastCheckpointDate = "lastCheckPoint"
	}
}
