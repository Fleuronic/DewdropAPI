// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Group
import struct Dewdrop.Collection
import protocol Catena.Payload

struct GroupPayload {
	let group: Group
	let collectionIDs: [Collection.ID]
}

// MARK: -
extension GroupPayload: Payload {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(group.title, forKey: .title)
		try container.encode(group.isHidden, forKey: .isHidden)
		try container.encode(group.sortIndex, forKey: .sortIndex)
		try container.encode(collectionIDs, forKey: .collectionIDs)
	}
}

// MARK: -
private extension GroupPayload {
	enum CodingKeys: String, CodingKey {
		case title
		case isHidden = "hidden"
		case sortIndex = "sort"
		case collectionIDs = "collections"
	}
}
