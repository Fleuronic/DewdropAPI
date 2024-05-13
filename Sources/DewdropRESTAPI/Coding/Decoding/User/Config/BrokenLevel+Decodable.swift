// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config.BrokenLevel: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)

		self = switch value {
		case "basic": .basic
		case "default": .default
		case "strict": .strict
		case "off": .off
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
