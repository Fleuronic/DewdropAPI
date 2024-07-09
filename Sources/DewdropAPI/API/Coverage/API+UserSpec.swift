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
	public func fetchUserAuthenticatedDetails() async -> Self.Result<UserAuthenticatedDetailsFields> {
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
//	
//	public func updateUser(
//		email: String? = nil,
//		fullName: String? = nil,
//		oldPassword: String? = nil,
//		newPassword: String? = nil,
//		config: User.Config? = nil,
//		groups: [(Group, [Collection.ID])]? = nil
//	) async -> Self.Result<UserAuthenticatedDetailsFields> {
//		await put(/.user) {
//			UserUpdatePayload(
//				email: email,
//				fullName: fullName,
//				oldPassword: oldPassword,
//				newPassword: newPassword,
//				config: config,
//				groups: groups.map {
//					$0.map { group, collectionIDs in
//						.init(
//							group: group,
//							collectionIDs: collectionIDs
//						)					
//					}
//				}
//			)
//		}
//	}
}
