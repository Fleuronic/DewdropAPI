// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL
import protocol Catena.Payload

struct CollectionPayload {
	let title: String?
	let coverURL: URL?
	let `public`: Bool?
}

// MARK: -
extension CollectionPayload: Payload {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(title, forKey: .title)
		try container.encode([coverURL], forKey: .coverURL)
		try container.encode(`public`, forKey: .public)
	}
}

// MARK: -
private extension CollectionPayload {
	enum CodingKeys: String, CodingKey {
		case title
		case coverURL = "cover"
		case `public` = "isPublic"
	}
}
