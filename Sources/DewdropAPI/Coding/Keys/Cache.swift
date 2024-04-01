// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Cache

extension Cache {
	enum CodingKeys: String, CodingKey {
		case status
		case size
		case creationDate = "created"
	}
}
