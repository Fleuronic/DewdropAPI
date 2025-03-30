// Copyright © Fleuronic LLC. All rights reserved.

@testable import struct DewdropAPI.API

import class DewdropRESTAPI.UserEndpointsMock
import struct DewdropRESTAPI.UserResponse

extension API where UserEndpoints == UserEndpointsMock {
	func mockFetchUser(byReturning fixture: Fixture) {
		userEndpoints.mockGetUserByName { _ -> UserResponse<UserSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockFetchAuthenticatedUser(byReturning fixture: Fixture) {
		userEndpoints.mockGetUser { () -> UserResponse<UserAuthenticatedSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockConnectSocialNetworkAccount(byReturning fixture: Fixture) {
		userEndpoints.mockConnectSocialNetworkAccount { _ in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockDisconnectSocialNetworkAccount(byReturning fixture: Fixture) {
		userEndpoints.mockDisconnectSocialNetworkAccount { _ in
			try response(returnedFromPath: fixture.path)
		}
	}
}
