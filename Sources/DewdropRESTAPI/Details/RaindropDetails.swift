// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.User
import struct Dewdrop.Collection
import struct Catena.IDFields
import struct DewdropService.IdentifiedRaindrop
import protocol DewdropService.RaindropFields
import protocol DewdropService.UserFields
import protocol DewdropService.HighlightFields
import protocol Catena.Valued
import protocol Catenary.Fields
import protocol Catenary.Details

@dynamicMemberLookup
public struct RaindropDetails<
	CreatorFields: UserFields & Decodable,
	HighlightInRaindropFields: HighlightFields & Decodable
>: RaindropFields {
	public let id: Raindrop.ID
	public let owner: User.IDFields
	public let creator: CreatorFields
	public let collection: Collection.IDFields
	public let tags: [TagNameFields]
	public let highlights: [HighlightInRaindropFields]?

	private let raindrop: Raindrop
}

// MARK: -
public extension RaindropDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case creator = "creatorRef"
		case collection
		case tags
		case highlights
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Raindrop, T>) -> T {
		raindrop[keyPath: keyPath]
	}
}

// MARK: -
extension RaindropDetails: Details {
	// MARK: Valued
	public typealias Value = Raindrop

	// MARK: Representable
	public var value: Value { raindrop }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			owner: container.decode(for: .owner),
			creator: container.decode(for: .creator),
			collection: container.decode(for: .collection),
			tags: container.decode(for: .tags),
			highlights: container.decodeIfPresent(for: .highlights),
			raindrop: .init(from: decoder)
		)
	}
}
