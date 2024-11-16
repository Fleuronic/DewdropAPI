// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection

@dynamicMemberLookup
public struct ConfigFields: Sendable /* TODO */ {
	public let lastViewedCollection: Collection.IDFields

	private let config: User.Config

	public init(
		config: User.Config,
		lastViewedCollectionID: Collection.ID
	) {
		self.config = config
		lastViewedCollection = .init(id: lastViewedCollectionID)
	}
}

// MARK -
public extension ConfigFields {
	subscript<T>(dynamicMember keyPath: KeyPath<User.Config, T>) -> T {
		config[keyPath: keyPath]
	}
}

extension ConfigFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case lastViewedCollectionID = "lastCollection"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			config: .init(from: decoder),
			lastViewedCollectionID: container.decode(for: .lastViewedCollectionID)
		)
	}
}
