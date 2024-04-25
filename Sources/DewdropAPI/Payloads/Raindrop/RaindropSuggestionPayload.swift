// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import protocol Catenary.Payload

struct RaindropSuggestionPayload: Payload {
	let url: URL
}

// MARK: -
extension RaindropSuggestionPayload {
	enum CodingKeys: String, CodingKey {
		case url = "link"
	}
}
