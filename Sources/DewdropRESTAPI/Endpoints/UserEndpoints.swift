// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.User
import struct Dewdrop.Group
import struct Dewdrop.Network
import protocol DewdropService.UserFields

@API @Mock @JSON(encoder: DewdropEncoder(), decoder: DewdropDecoder())
public protocol UserEndpoints {
	init(provider: Provider)

	@GET("/user")
	func getUser<Fields>() async throws -> UserResponse<Fields>

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

	@GET("/user/connect/{provider}")
	func connectSocialNetworkAccount(provider: Network.Provider) async throws

	@GET("/user/connect/{provider}/revoke")
	func disconnectSocialNetworkAccount(provider: Network.Provider) async throws
}

// MARK: -
public extension UserEndpointsMock {
	convenience init(provider: Provider) {
		self.init()
	}
}
