// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionDetailsFields

extension CollectionDetailsFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}
}
