// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection

public struct CollectionMergeFields {
	public let ids: [Collection.ID]
	public let modifiedCount: Int
}

// MARK: -
extension CollectionMergeFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case ids
		case modifiedCount = "modified"
	}
}
