// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catena.Payload

struct CollectionReorderPayload: Payload {
	let sort: Collection.Sort
}
