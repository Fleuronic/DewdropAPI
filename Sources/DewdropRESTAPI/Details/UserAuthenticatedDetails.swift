// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.User
import struct Dewdrop.Account
import protocol DewdropService.UserAuthenticatedFields

@dynamicMemberLookup
public struct UserAuthenticatedDetails: UserAuthenticatedFields {
	public let id: User.ID
	public let config: ConfigFields
	public let groups: [GroupDetails]

	private let account: Account
}

// MARK -
public extension UserAuthenticatedDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Account, T>) -> T {
		account[keyPath: keyPath]
	}

	subscript<T>(dynamicMember keyPath: KeyPath<User, T>) -> T {
		account.user[keyPath: keyPath]
	}
}

extension UserAuthenticatedDetails: Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}

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
