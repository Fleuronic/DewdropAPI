// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag

extension Tag.Sort: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .count: "-count"
		case .name: "_id"
		}
		
		try container.encode(string)
	}
}