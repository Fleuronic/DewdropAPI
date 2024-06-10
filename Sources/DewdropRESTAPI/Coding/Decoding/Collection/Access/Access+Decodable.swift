// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Collection

@AutoDecodable(accessControl: .public)
extension Collection.Access: Decodable {
	private enum CodingKeys: String, CodingKey {
		case level
		case isDraggable = "draggable"
	}
}

