// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.CollectionMergeFields

@AutoDecodable(accessControl: .public)
extension CollectionMergeFields: Swift.Decodable {
	enum CodingKeys: String, CodingKey {
		case ids
		case modifiedCount = "modified"
	}
}
