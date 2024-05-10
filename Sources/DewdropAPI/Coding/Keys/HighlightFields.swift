// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.HighlightFields

extension HighlightFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case raindropID = "raindropRef"
	}
}
