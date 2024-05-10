// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL
import protocol Catena.Payload

struct CollectionPayload {
	let title: String?
	let coverURL: URL?
	let `public`: Bool?
	let view: Collection.View?
	let sortIndex: Int?
	let expanded: Bool?
	let parentID: Collection.ID?
}

// MARK: -
extension CollectionPayload: Payload {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(title, forKey: .title)
		try container.encode([coverURL], forKey: .coverURL)
		try container.encode(`public`, forKey: .public)
		try container.encode(view, forKey: .view)
		try container.encode(sortIndex, forKey: .sortIndex)
		try container.encode(expanded, forKey: .expanded)
		try container.encode(parentID, forKey: .parentID)
	}
}

// MARK: -
private extension CollectionPayload {
	enum CodingKeys: String, CodingKey {
		case title
		case coverURL = "cover"
		case `public` = "isPublic"
		case view
		case sortIndex = "sort"
		case expanded
		case parentID
	}
}
