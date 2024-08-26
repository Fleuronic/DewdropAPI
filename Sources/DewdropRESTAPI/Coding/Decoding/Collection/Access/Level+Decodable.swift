// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Access.Level: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(Int.self)

		self = switch value {
		case 1: .readOnly
		case 2: .collaborator(.readOnly)
		case 3: .collaborator(.readWrite)
		case 4: .owner
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
