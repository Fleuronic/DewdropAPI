// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Password
import struct Dewdrop.User
import struct Dewdrop.Group
import struct Dewdrop.Network
import struct DewdropRESTAPI.GroupDetails
import struct Identity.Identifier
import protocol DewdropService.UserSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: UserSpec {
	#if swift(<6.0)
	public typealias PublicUserFetchFields = UserPublicSpecifiedFields
	public typealias AuthenticatedUserFetchFields = UserAuthenticatedSpecifiedFields
	public typealias AuthenticatedUserUpdatedFields = UserAuthenticatedSpecifiedFields
	#endif
	
	public func fetchUser(with id: User.ID) async -> SingleResult<UserPublicSpecifiedFields> {
		await result {
			try await users.getUserByName(name: id).user
		}
	}

	public func fetchAuthenticatedUser() async -> SingleResult<UserAuthenticatedSpecifiedFields> {
		await result {
			try await users.getUser().user
		}
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> SingleResult<Bool> {
		await result {
			try await users.connectSocialNetworkAccount(provider: provider).result
		}
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> SingleResult<Bool> {
		await result {
			try await users.disconnectSocialNetworkAccount(provider: provider).result
		}
	}

	public func updateAuthenticatedUser(
		fullName: String? = nil,
		email: String? = nil,
		password: Password? = nil,
		config: User.Config? = nil,
		groups: [GroupDetails]? = nil
	) async -> SingleResult<UserUpdateSpecifiedFields> {
		let newPassword: String?
		let oldPassword: String?

		switch password {
		case let .updated(from, to):
			newPassword = to
			oldPassword = from
		default:
			newPassword = nil
			oldPassword = nil
		}

		return await result {
			try await users.updateUser(
				fullName: fullName,
				email: email,
				oldpassword: oldPassword,
				newpassword: newPassword,
				config: config,
				groups: groups
			).user
		}
	}
}
