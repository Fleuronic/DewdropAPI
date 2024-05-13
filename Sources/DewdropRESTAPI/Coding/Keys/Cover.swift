// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Cover {
	enum CodingKeys: String, CodingKey {
		case title
		case iconSets = "icons"
	}
}

