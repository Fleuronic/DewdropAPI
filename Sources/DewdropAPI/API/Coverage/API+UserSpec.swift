// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Network
import struct DewdropService.UserPublicFields
import struct Identity.Identifier
import protocol DewdropService.UserSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: UserSpec {
	public func fetchAuthenticatedUser() async -> Response<UserAuthenticatedFields> {
		await response {
			try await users.getUser().user
		}
	}

	public func fetchUser(with id: User.ID) async -> Response<UserPublicFields> {
		await response {
			try await users.getUserByName(name: id).user
		}
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> Response<Void> {
		await response {
			try await users.connectSocialNetworkAccount(provider: provider)
		}
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> Response<Void> {
		await response {
			try await users.disconnectSocialNetworkAccount(provider: provider)
		}
	}
}
