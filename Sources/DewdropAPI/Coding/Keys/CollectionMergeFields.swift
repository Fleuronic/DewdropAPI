// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionMergeFields

extension CollectionMergeFields {
	enum CodingKeys: String, CodingKey {
		case ids
		case modifiedCount = "modified"
	}
}
