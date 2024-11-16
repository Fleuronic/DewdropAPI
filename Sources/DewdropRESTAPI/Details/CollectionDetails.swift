// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Collection
import struct Dewdrop.User
import protocol DewdropService.CollectionFields

@dynamicMemberLookup
@_UncheckedMemberwiseInit(.public)
public struct CollectionDetails: CollectionFields {
	public let id: Collection.ID
	public let parent: Collection.IDFields?
	public let owner: User.IDFields

	private let collection: Collection
}

// MARK: -
public extension CollectionDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Collection, T>) -> T {
		collection[keyPath: keyPath]
	}
}

// MARK: -
extension CollectionDetails: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case owner = "user"
		case parent
	}

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
