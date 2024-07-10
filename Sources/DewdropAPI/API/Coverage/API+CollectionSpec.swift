// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	public typealias CollectionList = Self.Result<[CollectionListFields]>
	public typealias CollectionListFields = CollectionDetailsFields
	public typealias ChildCollectionList = CollectionList
	public typealias ChildCollectionListFields = CollectionListFields
	public typealias SystemCollectionList = Self.Result<[SystemCollectionListFields]>
	public typealias SystemCollectionListFields = CollectionCountFields

	public func listRootCollections() async -> CollectionList {
		await result {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> ChildCollectionList {
		await result {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> SystemCollectionList {
		await result {
			try await collections.getSystemCollections().items
		}
	}
}
