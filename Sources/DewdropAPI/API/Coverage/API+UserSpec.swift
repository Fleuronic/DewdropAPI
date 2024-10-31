// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Network
import struct DewdropService.UserAuthenticatedDetailsFields
import struct DewdropService.UserPublicDetailsFields
import struct Identity.Identifier
import protocol DewdropService.UserSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: UserSpec {
	public func fetchUserAuthenticatedDetails() async -> Response<UserDetailsFields> {
		await result {
			try await users.getUser().user
		}
	}

	public func fetchUserPublicDetails(with id: User.ID) async -> Response<UserPublicDetailsFields> {
		await result {
			try await users.getUserByName(name: id).user
		}
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> Response<Void> {
		await result {
			try await users.connectSocialNetworkAccount(provider: provider)
		}
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> Response<Void> {
		await result {
			try await users.disconnectSocialNetworkAccount(provider: provider)
		}
	}
}
