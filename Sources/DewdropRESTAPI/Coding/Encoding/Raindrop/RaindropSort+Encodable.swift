// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Raindrop

import enum Foundation.SortOrder

extension Raindrop.Sort: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .order: "-sort"
		case .score: "score"
		case let .criterion(criterion, sortOrder): sortOrder.prefix + criterion.stringValue
		}
		
		try container.encode(string)
	}
}

private extension Raindrop.Sort.Criterion {
	var stringValue: String {
		switch self {
		case .title: "title"
		case .domain: "domain"
		case .creationDate: "created"
		}
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
