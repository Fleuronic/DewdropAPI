// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.View: @retroactive Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .list: "list"
		case .simple: "simple"
		case .grid: "grid"
		case .masonry: "masonry"
		}
		
		try container.encode(string)
	}
}
