// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop

extension Raindrop {
	enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		case itemType = "type"
		case excerpt
		case domain
		case coverURL = "cover"
		case media
		case note
		case cache
		case isFavorite = "important"
		case isBroken = "broken"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}
}
