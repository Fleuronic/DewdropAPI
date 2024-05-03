// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropImportFields

extension RaindropImportFields {
	enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		case excerpt
		case coverURL = "cover"
		case media
		case note
		case isFavorite = "important"
		case creationDate = "created"
		case updateDate = "lastUpdate"
		case tags
		case highlights
	}
}
