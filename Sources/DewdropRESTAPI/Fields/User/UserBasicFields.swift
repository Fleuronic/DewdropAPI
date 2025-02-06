// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Foundation.URL
import protocol DewdropService.UserFields
import protocol Catenary.Fields

public struct UserBasicFields: UserFields {
	public let id: User.ID
	public let username: String
	public let avatarURL: URL?
}

// MARK: -
extension UserBasicFields: Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: User.CodingKeys.self)
		let idContainer = try decoder.container(keyedBy: User.IDFields.CodingKeys.self)

		try self.init(
			id: idContainer.decode(for: .id),
			username: container.decode(for: .username),
			avatarURL: container.decode(for: .avatarURL)
		)
	}
}
