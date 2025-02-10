// Copyright © Fleuronic LLC. All rights reserved.

import class DewdropRESTAPI.CollectionEndpointsMock
import struct DewdropRESTAPI.CollectionResponse
import struct DewdropRESTAPI.CollectionsResponse
import struct DewdropRESTAPI.SuccessResponse
import typealias DewdropRESTAPI.SystemCollectionsCountResponse
import class DewdropRESTAPI.UserEndpointsMock

@testable import struct DewdropAPI.API

extension API where CollectionEndpoints == CollectionEndpointsMock, UserEndpoints == UserEndpointsMock {
	func mockFetchCollection(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetCollection {
			_ -> CollectionResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListSystemCollections(byReturning fixture: Fixture) {
		userEndpoints.mockGetSystemCollectionsCount { () -> SystemCollectionsCountResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListRootCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetRootCollections {
			() -> CollectionsResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockListChildCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetChildCollections {
			() -> CollectionsResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockRemoveCollection(byReturning fixture: Fixture) {
		collectionEndpoints.mockRemoveCollection { _ -> SuccessResponse in
			try response(returnedFromPath: fixture.path)
		}
	}
}
