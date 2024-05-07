// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Foundation.URL
import protocol Catena.Payload

struct RaindropPayload: Payload {
	let url: URL
}

// MARK: -
private extension RaindropPayload {
	enum CodingKeys: String, CodingKey {
		case url = "link"
	}
}
