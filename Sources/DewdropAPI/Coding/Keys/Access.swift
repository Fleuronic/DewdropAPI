// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Access {
	enum CodingKeys: String, CodingKey {
		case level
		case isDraggable = "draggable"
	}
}
