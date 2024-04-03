// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.FilterListFields

extension FilterListFields {
	enum CodingKeys: String, CodingKey {
		case favorited = "important"
		case duplicate = "duplicates"
		case untagged = "notag"
		case broken
		case tags
		case types
	}
}
