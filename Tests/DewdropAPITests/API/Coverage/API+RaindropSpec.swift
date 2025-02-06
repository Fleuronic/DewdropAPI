// Copyright © Fleuronic LLC. All rights reserved.

@testable import struct DewdropAPI.API

import class DewdropRESTAPI.RaindropEndpointsMock
import typealias DewdropRESTAPI.RaindropResponse
import typealias DewdropRESTAPI.RaindropsResponse

extension API where RaindropEndpoints == RaindropEndpointsMock {
	func mockFetchRaindrop(byReturning fixture: Fixture) {
		raindropEndpoints.mockGetRaindrop { _ -> RaindropResponse<RaindropFetchSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListRaindrops(byReturning fixture: Fixture) {
		raindropEndpoints.mockGetRaindrops { _, _, _, _, _ -> RaindropsResponse<RaindropListSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}
}
