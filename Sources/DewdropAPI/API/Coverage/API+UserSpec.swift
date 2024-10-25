// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.User
public import struct Dewdrop.Network
public import struct DewdropService.UserAuthenticatedDetailsFields
public import struct DewdropService.UserPublicDetailsFields
public import struct Identity.Identifier
public import protocol DewdropService.UserSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

extension API: UserSpec {
	public func fetchUserAuthenticatedDetails() async -> Self.Result<UserDetailsFields> {
		await result {
			try await users.getUser().user
		}
	}

	public func fetchUserPublicDetails(with id: User.ID) async -> Self.Result<UserPublicDetailsFields> {
		await result {
			try await users.getUserByName(name: id).user
		}
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<Void> {
		await result {
			try await users.connectSocialNetworkAccount(provider: provider)
		}
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<Void> {
		await result {
			try await users.disconnectSocialNetworkAccount(provider: provider)
		}
	}
}
