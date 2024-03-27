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
}
