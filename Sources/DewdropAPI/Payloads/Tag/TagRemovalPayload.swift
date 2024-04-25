// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Payload

struct TagRemovalPayload: Payload {
	let tagNames: [String]
}

// MARK: -
extension TagRemovalPayload {
	enum CodingKeys: String, CodingKey {
		case tagNames = "tags"
	}
}
