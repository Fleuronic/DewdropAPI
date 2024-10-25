// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Collection

import enum Foundation.SortOrder

extension Collection.Sort: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
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
