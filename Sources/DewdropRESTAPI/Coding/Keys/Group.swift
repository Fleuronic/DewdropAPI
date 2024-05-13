// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Group

extension Group {
	enum CodingKeys: String, CodingKey {
		case title
		case isHidden = "hidden"
		case sortIndex = "sort"
	}
}
