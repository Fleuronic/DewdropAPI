// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import struct Dewdrop.User
import struct Dewdrop.Group
import struct Dewdrop.Collection
import struct Dewdrop.Network
import struct DewdropService.UserAuthenticatedFields
import struct DewdropService.UserDetailsFields
import struct Foundation.URL
import protocol DewdropService.UserSpec

extension API: UserSpec {
	public func fetchUserAuthenticatedDetails() async -> Self.Result<UserAuthenticatedFields> {
		await get(/.user)
	}

	public func fetchUserDetails(with id: User.ID) async -> Self.Result<UserDetailsFields> {
		await get(/.user, /id)
	}
	
	public func connectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<URL> {
		await get(/.user, /.connect, /provider)
	}
	
	public func disconnectSocialNetworkAccount(from provider: Network.Provider) async -> Self.Result<Void> {
		await get(/.user, /.connect, /provider, /.revoke)
	}
	
	public func updateUser(
		email: String? = nil,
		fullName: String? = nil,
		oldPassword: String? = nil,
		newPassword: String? = nil,
		config: User.Config? = nil,
		groups: [(Group, [Collection.ID])]? = nil
	) async -> Self.Result<UserAuthenticatedFields> {
		await put(/.user) {
			UserUpdatePayload(
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
		}
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case user
	case connect
	case revoke
}

private prefix func /(component: PathComponents) -> PathComponent { component }
