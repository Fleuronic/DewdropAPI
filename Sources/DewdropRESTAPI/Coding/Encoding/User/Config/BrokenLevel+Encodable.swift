// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config.BrokenLevel: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .basic: "basic"
		case .default: "default"
		case .strict: "strict"
		case .off: "off"
		}
		
		try container.encode(string)
	}
}
