// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.User
import protocol DewdropService.CollectionFields
import protocol Catenary.Details

@dynamicMemberLookup
public struct CollectionDetails: CollectionFields {
	public let id: Collection.ID
	public let parent: Collection.IDFields?
	public let owner: User.IDFields

	private let collection: Collection
}

// MARK: -
public extension CollectionDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Collection, T>) -> T {
		collection[keyPath: keyPath]
	}
}

// MARK: -
extension CollectionDetails: Details {
	// MARK: Valued
	public typealias Value = Collection

	// MARK: Representable
	public var value: Value { collection }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			parent: container.decodeIfPresent(for: .parent),
			owner: container.decode(for: .owner),
			collection: .init(from: decoder)
		)
	}
}
