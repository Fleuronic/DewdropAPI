// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import protocol Catena.Payload

struct UserUpdatePayload: Payload {
	let email: String?
	let fullName: String?
	let oldPassword: String?
	let newPassword: String?
	let config: User.Config?
	let groups: [GroupPayload]?
}

// MARK: -
extension UserUpdatePayload {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case oldPassword = "oldpassword"
		case newPassword = "newpassword"
		case config
		case groups
	}
}
