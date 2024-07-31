// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension User.Config.FontColor: Codable {
	private enum CodingKeys: String, CodingKey {
		case sunset
		case night
	}
}

extension User.Config.FontColor: @retroactive LosslessStringConvertible {
	public var description: String { rawValue }
	
	public init?(_ rawValue: String) {
		self.init(rawValue: rawValue)
	}
}
