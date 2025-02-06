// Copyright © Fleuronic LLC. All rights reserved.

@testable import struct DewdropAPI.API

import class DewdropRESTAPI.CollectionEndpointsMock
import class DewdropRESTAPI.UserEndpointsMock
import struct DewdropRESTAPI.CollectionResponse
import struct DewdropRESTAPI.CollectionsResponse
import typealias DewdropRESTAPI.SystemCollectionsCountResponse

extension API where CollectionEndpoints == CollectionEndpointsMock, UserEndpoints == UserEndpointsMock {
	func mockFetchCollection(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetCollection { _ -> CollectionResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListSystemCollections(byReturning fixture: Fixture) {
		userEndpoints.mockGetSystemCollectionsCount { () -> SystemCollectionsCountResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListRootCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetRootCollections { () -> CollectionsResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}
}
