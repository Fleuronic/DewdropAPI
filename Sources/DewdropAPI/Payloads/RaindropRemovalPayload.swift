// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catenary.Payload

struct RaindropRemovalPayload: Payload {
	let ids: [Raindrop.ID]
}
