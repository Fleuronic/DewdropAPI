// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.View: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)

		self = switch value {
		case "list": .list
		case "simple": .simple
		case "grid": .grid
		case "masonry": .masonry
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
