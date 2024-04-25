// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import protocol Catenary.Payload

struct HighlightAdditionPayload: Payload {
	let contents: [Highlight.Content]
}

// MARK: -
private extension HighlightAdditionPayload {
	enum CodingKeys: String, CodingKey {
		case contents = "highlights"
	}
}
