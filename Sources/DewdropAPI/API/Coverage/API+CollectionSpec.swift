// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catenary.API

extension API: CollectionSpec {
	public typealias CollectionListFields = CollectionDetailsFields
	public typealias SystemCollectionListFields = CollectionCountFields

	public func listRootCollections() async -> Self.Result<[CollectionListFields]> {
		await result {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Self.Result<[CollectionListFields]> {
		await result {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Self.Result<[SystemCollectionListFields]> {
		await result {
			try await collections.getSystemCollections().items
		}
	}
}
