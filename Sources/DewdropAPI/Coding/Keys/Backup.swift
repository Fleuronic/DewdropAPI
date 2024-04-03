// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Backup

extension Backup {
	enum CodingKeys: String, CodingKey {
		case creationDate = "created"
	}
}
