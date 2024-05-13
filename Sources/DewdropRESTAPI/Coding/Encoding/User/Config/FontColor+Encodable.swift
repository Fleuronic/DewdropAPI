// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config.FontColor: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .sunset: "sunset"
		case .night: "night"
		}
		
		try container.encode(string)
	}
}