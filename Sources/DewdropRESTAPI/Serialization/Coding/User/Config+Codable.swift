// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.User

@AutoDecodable(accessControl: .public)
@AutoEncodable(accessControl: .public)
extension User.Config: Codable {
	private enum CodingKeys: String, CodingKey {
		case fontSize
		@DecodedValue(Filled<FontColor>.self)
		@EncodedValue(Filled<FontColor>.self)
		case fontColor
		case brokenLevel
		@Conditional case languageCode = "lang"
		case defaultRaindropSort = "raindropsSort"
		case defaultCollectionView
	}
}
