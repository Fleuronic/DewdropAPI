// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoEncodable(accessControl: .public)
@AutoDecodable(accessControl: .public)
extension User.Config: Swift.Codable {
	private enum CodingKeys: String, CodingKey {
		case fontSize
		@DecodedValue(Filled<FontColor>.self) case fontColor
		case brokenLevel
		@Conditional case languageCode = "lang"
		case defaultRaindropSort = "raindropsSort"
		case defaultCollectionView
	}
}
