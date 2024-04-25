// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import protocol Catenary.Payload

struct HighlightRemovalPayload {
	let ids: [Highlight.ID]
}

// MARK: -
extension HighlightRemovalPayload: Payload {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		let payloads = ids.map { id in
			HighlightPayload(
				id: id,
				text: .init()
			)
		}

		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(payloads, forKey: .highlights)
	}
}

// MARK: -
private extension HighlightRemovalPayload {
	enum CodingKeys: String, CodingKey {
		case highlights
	}
}

// MARK: -
private struct HighlightPayload: Payload {
	let id: Highlight.ID
	let text: String
}

// MARK: -
private extension HighlightPayload {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case text
	}
}
