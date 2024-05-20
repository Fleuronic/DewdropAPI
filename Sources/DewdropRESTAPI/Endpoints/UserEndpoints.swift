// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Network
import struct DewdropService.IdentifiedUser

@API @JSON(decoder: .dewdrop)
public protocol UserEndpoints {
	@GET("/user/{name}")
	func getUserByName(name: User.ID) async throws -> UserPublicDetailsResponse

	@GET("/user/{provider}")
	func connectSocialNetworkAccount(provider: Network.Provider) async throws

	@GET("/user/connect/{provider}/revoke")
	func disconnectSocialNetworkAccount(provider: Network.Provider) async throws
}
