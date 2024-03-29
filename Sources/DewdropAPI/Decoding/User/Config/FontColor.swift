// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config.FontColor {
	// MARK: Decodable
	public init?(string value: String) {
		switch value {
		case "sunset": self = .sunset
		case "night": self = .night
		default: return nil
		}
	}
}
