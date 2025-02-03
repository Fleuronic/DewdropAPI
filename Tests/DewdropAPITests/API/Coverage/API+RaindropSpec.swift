// Copyright © Fleuronic LLC. All rights reserved.

@testable import struct DewdropAPI.API

import class DewdropRESTAPI.RaindropEndpointsMock
import typealias DewdropRESTAPI.RaindropResponse

public extension API where RaindropEndpoints == RaindropEndpointsMock {
	func mockFetchRaindrop() {
		raindropEndpoints.mockGetRaindrop { id -> RaindropResponse<RaindropFetchSpecifiedFields> in
			let path = switch id {
			case .invalid: "FetchInvalidRaindrop"
			default: "FetchRaindrop"
			}

			return try response(returnedFromPath: path)
		}
	}
}
