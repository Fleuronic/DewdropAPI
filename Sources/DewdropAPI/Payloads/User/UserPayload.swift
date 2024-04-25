// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Payload

struct UserUpdatePayload: Payload {
	let email: String?
	let fullName: String?
	let oldPassword: String?
	let newPassword: String?
	// TODO
}

// MARK: -
extension UserUpdatePayload {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case oldPassword = "oldpassword"
		case newPassword = "newpassword"
	}
}
