// Copyright © Fleuronic LLC. All rights reserved.

import enum Foundation.SortOrder
import struct Dewdrop.Raindrop

extension Raindrop.Sort: @retroactive Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		let criterion = Criterion(string: value)

		self = switch (value, criterion) {
		case ("-sort", _): .order
		case (_, let criterion?): .criterion(criterion, value.hasPrefix("-") ? .reverse : .forward)
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}

private extension Raindrop.Sort.Criterion {
	init?(string value: String) {
		if value.hasSuffix("title") {
			self = .title
		} else if value.hasSuffix("domain") {
			self = .domain
		} else if value.hasSuffix("created") {
			self = .creationDate
		} else {
			return nil
		}
	}
}
