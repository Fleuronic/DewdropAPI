// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Group
import struct Dewdrop.Collection
import struct Dewdrop.Network
import struct DewdropService.UserAuthenticatedFields
import struct DewdropService.UserDetailsFields
import struct Foundation.URL
import protocol DewdropService.UserSpec
import protocol Catena.API

extension API: UserSpec {
	public func fetchUserAuthenticatedDetails() async -> Self.Result<UserAuthenticatedFields> {
		let path = "user"
		return await getResource(at: path)
	}

	public func fetchUserDetails(with id: User.ID) async -> Self.Result<UserDetailsFields> {
		let path = "user/\(id)"
		return await getResource(at: path)
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<URL> {
		let path = "user/connect/\(provider)"
		return await getResource(at: path)
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<Void> {
		let path = "user/connect/\(provider)/revoke"
		return await getResource(at: path)
	}
	
	public func updateUser(
		email: String? = nil,
		fullName: String? = nil,
		oldPassword: String? = nil,
		newPassword: String? = nil,
		config: User.Config? = nil,
		groups: [(Group, [Collection.ID])]? = nil
	) async -> Self.Result<UserAuthenticatedFields> {
		let path = "user"
		let payload = UserPayload(
			email: email,
			fullName: fullName,
			oldPassword: oldPassword,
			newPassword: newPassword,
			config: config,
			groups: groups.map {
				$0.map { group, collectionIDs in
					.init(
						group: group,
						collectionIDs: collectionIDs
					)					
				}
			}
		)

		return await put(payload, at: path)
	}
}
