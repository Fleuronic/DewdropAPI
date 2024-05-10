// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL
import protocol Catena.Payload

struct CollectionPayload {
	let title: String?
	let coverURL: URL?
	let view: Collection.View?
	let sortIndex: Int?
	let `public`: Bool?
	let expanded: Bool?
	let parentID: Collection.ID?
}

// MARK: -
extension CollectionPayload: Payload {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encodeIfPresent(title, forKey: .title)
		try container.encodeIfPresent([coverURL], forKey: .coverURL)
		try container.encodeIfPresent(view, forKey: .view)
		try container.encodeIfPresent(sortIndex, forKey: .sortIndex)
		try container.encodeIfPresent(`public`, forKey: .public)
		try container.encodeIfPresent(expanded, forKey: .expanded)
		try container.encodeIfPresent(parentID, forKey: .parentID)
	}
}

// MARK: -
private extension CollectionPayload {
	enum CodingKeys: String, CodingKey {
		case title
		case coverURL = "cover"
		case view
		case sortIndex = "sort"
		case `public` = "isPublic"
		case expanded
		case parentID
	}
}
