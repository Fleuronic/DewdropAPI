// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Collection

extension Collection.Cover {
	enum CodingKeys: String, CodingKey {
		case title
		case iconSets = "icons"
	}
}

