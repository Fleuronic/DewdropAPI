// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Cache

extension Cache {
	enum CodingKeys: String, CodingKey {
		case status
		case size
		case creationDate = "created"
	}
}
