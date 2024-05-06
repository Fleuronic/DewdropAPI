// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight

extension Highlight {
	enum CodingKeys: String, CodingKey {
		case title
		case text
		case color
		case note
		case raindropURL = "link"
		case creationDate = "created"
	}
}
