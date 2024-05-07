// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catena.Payload

struct RaindropUploadPayload: Payload {
	let collectionID: Collection.ID
}

// MARK: -
private extension RaindropUploadPayload {
	enum CodingKeys: String, CodingKey {
		case collectionID = "collectionId"
	}
}
