// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Group
import struct Dewdrop.Collection
import struct Catena.IDFields
import protocol DewdropService.GroupFields
import protocol Catenary.Details

@dynamicMemberLookup
public struct GroupDetails: GroupFields {
	public let collections: [Collection.IDFields]

	private let group: Group

	public init(
		group: Group,
		collectionIDs: [Collection.ID]
	) {
		self.group = group
		self.collections = collectionIDs.map(IDFields.init)
	}
}

// MARK: -
public extension GroupDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Group, T>) -> T {
		group[keyPath: keyPath]
	}
}

// MARK: -
extension GroupDetails: Details {
	// MARK: Valued
	public typealias Value = Group

	// MARK: Representable
	public var id: Group.ID { .init(rawValue: group.sortIndex) }
	public var value: Value { group }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: DecodingKeys.self)

		try self.init(
			group: .init(from: decoder),
			collectionIDs: container.decode(for: .collections)
		)
	}
}

extension GroupDetails: Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: EncodingKeys.self)
		try container.encode(group.title, forKey: .title)
		try container.encode(group.sortIndex, forKey: .sortIndex)
		try container.encode(group.isHidden, forKey: .isHidden)
		try container.encode(collections, forKey: .collections)
	}
}

// MARK: -
private extension GroupDetails {
	enum DecodingKeys: String, CodingKey {
		case collections
	}

	enum EncodingKeys: String, CodingKey {
		case title
		case sortIndex = "sort"
		case isHidden = "hidden"
		case collections
	}

}
