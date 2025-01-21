// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Group
import struct Dewdrop.Network
import protocol DewdropService.UserFields

@API @JSON(encoder: .dewdrop, decoder: .dewdrop)
public protocol UserEndpoints {
	@GET("/user")
	func getUser<Fields>() async throws -> AuthenticatedUserResponse<Fields>

	@GET("/user/stats")
	func getSystemCollectionsCount() async throws -> SystemCollectionsCountResponse

	@GET("/user/{name}")
	func getUserByName<Fields>(name: User.ID) async throws -> UserResponse<Fields>

	@PUT("/user")
	func updateUser<Fields>(
		fullName: String?,
		email: String?,
		oldpassword: String?,
		newpassword: String?,
		config: User.Config?,
		groups: [GroupDetails]?
	) async throws -> UserResponse<Fields>

	@GET("/user/{provider}")
	func connectSocialNetworkAccount(provider: Network.Provider) async throws -> SuccessResponse

	@GET("/user/connect/{provider}/revoke")
	func disconnectSocialNetworkAccount(provider: Network.Provider) async throws -> SuccessResponse
}
