// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserAuthenticatedFields
import struct DewdropService.UserDetailsFields
import protocol DewdropService.UserSpec
import protocol Catenary.API

extension API: UserSpec {
	public func fetchUserAuthenticatedDetails() async -> Self.Result<UserAuthenticatedFields> {
		let path = "user"
		return await getResource(at: path)
	}

	public func fetchUserDetails(with id: User.ID) async -> Self.Result<UserDetailsFields> {
		let path = "user/\(id)"
		return await getResource(at: path)
	}
	
	public func updateUser(
		email: String? = nil,
		fullName: String? = nil,
		oldPassword: String? = nil,
		newPassword: String? = nil
	) async -> Self.Result<UserAuthenticatedFields> {
		let path = "user"
		let payload = UserUpdatePayload(
			email: email,
			fullName: fullName,
			oldPassword: oldPassword,
			newPassword: newPassword
		)

		return await put(payload, at: path)
	}
}
