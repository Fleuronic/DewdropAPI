// Copyright © Fleuronic LLC. All rights reserved.

import class DewdropRESTAPI.CollectionEndpointsMock
import struct DewdropRESTAPI.CollectionResponse
import struct DewdropRESTAPI.CollectionsResponse
import struct DewdropRESTAPI.SuccessResponse
import class DewdropRESTAPI.UserEndpointsMock
import typealias DewdropRESTAPI.SystemCollectionsCountResponse
import typealias DewdropRESTAPI.CollectionsRemovalResponse
import typealias DewdropRESTAPI.EmptyCollectionsRemovalResponse

@testable import struct DewdropAPI.API

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

	func mockListChildCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockGetChildCollections { () -> CollectionsResponse<CollectionSpecifiedFields> in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockExpandCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockExpandCollapseCollections { _ -> SuccessResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockSortCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockReorderCollections { _ -> SuccessResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockRemoveCollection(byReturning fixture: Fixture) {
		collectionEndpoints.mockRemoveCollection { _ -> SuccessResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockRemoveCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockRemoveMultipleCollections { _ -> CollectionsRemovalResponse in
			try response(returnedFromPath: fixture.path)
		}
	}

	func mockRemoveEmptyCollections(byReturning fixture: Fixture) {
		collectionEndpoints.mockRemoveAllEmptyCollections { () -> EmptyCollectionsRemovalResponse in
			try response(returnedFromPath: fixture.path)
		}
	}
}
