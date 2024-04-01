// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight

extension Highlight {
	enum CodingKeys: String, CodingKey {
		case title
		case raindropURL = "link"
	}
}
