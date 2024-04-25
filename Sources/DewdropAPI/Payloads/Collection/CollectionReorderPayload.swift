// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catenary.Payload

struct CollectionReorderPayload: Payload {
	let sort: Collection.Sort
}
