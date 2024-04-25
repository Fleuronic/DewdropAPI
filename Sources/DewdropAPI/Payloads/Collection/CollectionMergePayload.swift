// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catena.Payload

struct CollectionMergePayload: Payload {
	let sourceIDs: [Collection.ID]
	let destinationID: Collection.ID
}

// MARK: -
private extension CollectionMergePayload {
	enum CodingKeys: String, CodingKey {
		case sourceIDs = "ids"
		case destinationID = "to"
	}
}
