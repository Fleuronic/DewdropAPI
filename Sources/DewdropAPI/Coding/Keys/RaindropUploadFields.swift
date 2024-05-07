// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropCreationFields

extension RaindropCreationFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case creator = "creatorRef"
		case collection
		case tags
	}
}
