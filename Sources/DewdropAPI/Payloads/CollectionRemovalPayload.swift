// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catenary.Payload

struct CollectionRemovalPayload: Payload {
	let ids: [Collection.ID]
}
