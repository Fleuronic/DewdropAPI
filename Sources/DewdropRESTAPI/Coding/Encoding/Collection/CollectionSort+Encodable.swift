// Copyright © Fleuronic LLC. All rights reserved.

import enum Foundation.SortOrder
import struct Dewdrop.Collection

extension Collection.Sort: @retroactive Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .count: "-count"
		case let .title(sortOrder): sortOrder.prefix + "title"
		}
		
		try container.encode(string)
	}
}

private extension SortOrder {
	var prefix: String {
		switch self {
		case .forward: .init()
		case .reverse: "-"
		}
	}
}