// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.CollectionMergeFields

@AutoDecodable(accessControl: .public)
extension CollectionMergeFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case ids
		case modifiedCount = "modified"
	}
}
