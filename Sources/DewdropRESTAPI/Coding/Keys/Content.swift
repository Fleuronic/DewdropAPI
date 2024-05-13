// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight

extension Highlight.Content {
	enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
	}
}
