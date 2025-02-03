// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Dewdrop.User
import struct Foundation.Date
import protocol DewdropService.HighlightFields
import protocol DewdropService.UserFields
import protocol Catenary.Details

@dynamicMemberLookup
public struct HighlightInRaindropDetails<CreatorFields: UserFields & Decodable>: HighlightFields {
	public let id: Highlight.ID
	public let creator: CreatorFields

	private let highlight: Highlight
}

// MARK: -
public extension HighlightInRaindropDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Highlight, T>) -> T {
		highlight[keyPath: keyPath]
	}
}

// MARK: -
extension HighlightInRaindropDetails: Details {
	// MARK: Valued
	public typealias Value = Highlight

	// MARK: Representable
	public var value: Value { highlight }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			creator: container.decode(for: .creator),
			highlight: .init(from: decoder)
		)
	}
}

// MARK: -
private extension HighlightInRaindropDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case creator = "creatorRef"
	}
}
