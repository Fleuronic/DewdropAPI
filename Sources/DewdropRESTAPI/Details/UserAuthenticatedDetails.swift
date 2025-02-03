// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Account
import protocol Catena.Representable
import protocol Catenary.Details
import protocol DewdropService.UserAuthenticatedFields

@dynamicMemberLookup
public struct UserAuthenticatedDetails: UserAuthenticatedFields {
	public let id: User.ID
	public let config: ConfigFields
	public let groups: [GroupDetails]

	private let account: Account
}

// MARK: -
public extension UserAuthenticatedDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Account, T>) -> T {
		account[keyPath: keyPath]
	}
}

// MARK: -
extension UserAuthenticatedDetails: Details {
	// MARK: Valued
	public typealias Value = User

	// MARK: Representable
	public var value: Value { account.user }

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			config: container.decode(for: .config),
			groups: container.decode(for: .groups),
			account: .init(from: decoder)
		)
	}
}
