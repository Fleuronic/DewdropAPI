// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config {
	enum CodingKeys: String, CodingKey {
		case fontSize
		case fontColor
		case brokenLevel
		case languageCode = "lang"
		case defaultRaindropSort = "raindropsSort"
		case defaultCollectionView
	}
}

