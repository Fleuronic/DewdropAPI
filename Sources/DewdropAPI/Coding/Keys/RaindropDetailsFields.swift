// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropDetailsFields

extension RaindropDetailsFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case creator = "creatorRef"
		case collection
		case tags
		case highlights
	}
}
