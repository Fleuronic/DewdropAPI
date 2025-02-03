// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Dewdrop.Raindrop
import protocol DewdropService.HighlightFields
import protocol Catenary.Details

@dynamicMemberLookup
public struct HighlightDetails: HighlightFields {
	public let id: Highlight.ID
	public let raindrop: Raindrop.IDFields
	public let tags: [TagNameFields]

	private let highlight: Highlight
}

// MARK: -
public extension HighlightDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Highlight, T>) -> T {
		highlight[keyPath: keyPath]
	}
}

// MARK: -
extension HighlightDetails: Details {
	// MARK: Valued
	public typealias Value = Highlight

	// MARK: Representable
	public var value: Value { highlight }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			raindrop: container.decode(for: .raindrop),
			tags: container.decode(for: .tags),
			highlight: .init(from: decoder)
		)
	}
}

// MARK: -
private extension HighlightDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case raindrop = "raindropRef"
		case tags
	}
}
