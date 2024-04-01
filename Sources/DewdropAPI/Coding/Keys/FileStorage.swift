// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.FileStorage

extension FileStorage {
	enum CodingKeys: String, CodingKey {
		case usedSpace = "used"
		case totalSpace = "size"
		case lastCheckpointDate = "lastCheckPoint"
	}
}
