// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config.FontColor: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)

		self = switch value {
		case "sunset": .sunset
		case "night": .night
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
