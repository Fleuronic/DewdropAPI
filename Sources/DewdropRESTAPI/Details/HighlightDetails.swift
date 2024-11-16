// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Dewdrop.Raindrop
import protocol DewdropService.HighlightFields

@dynamicMemberLookup
public struct HighlightDetails: HighlightFields {
	public let id: Highlight.ID
	public let raindropID: Raindrop.ID
	public let tags: [TagNameFields]

	private let highlight: Highlight
}

// MARK: -
public extension HighlightDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Highlight, T>) -> T {
		highlight[keyPath: keyPath]
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Highlight.Content, T>) -> T {
		highlight.content[keyPath: keyPath]
	}
}

// MARK: -
extension HighlightDetails: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case raindropID = "raindropRef"
		case tags
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			raindropID: container.decode(for: .raindropID),
			tags: container.decode(for: .tags),
			highlight: .init(from: decoder)
		)
	}
}
