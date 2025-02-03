// Copyright © Fleuronic LLC. All rights reserved.

@testable import struct DewdropAPI.API

import class DewdropRESTAPI.UserEndpointsMock
import typealias DewdropRESTAPI.UserResponse
import typealias DewdropRESTAPI.AuthenticatedUserResponse

public extension API where UserEndpoints == UserEndpointsMock {
	func mockFetchUser() {
		userEndpoints.mockGetUserByName { id -> UserResponse<UserSpecifiedFields> in
			let path = "FetchUser"
			return try response(returnedFromPath: path)
		}
	}

	func mockFetchAuthenticatedUser() {
		userEndpoints.mockGetUser { () -> AuthenticatedUserResponse<UserAuthenticatedSpecifiedFields> in
			let path = "FetchAuthenticatedUser"
			return try response(returnedFromPath: path)
		}
	}
}
