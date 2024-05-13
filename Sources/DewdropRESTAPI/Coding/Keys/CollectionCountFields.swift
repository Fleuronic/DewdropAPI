// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionCountFields

extension CollectionCountFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case count
	}
}

