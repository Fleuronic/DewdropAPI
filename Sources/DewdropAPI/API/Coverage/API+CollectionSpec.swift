// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	// TODO: Remove
	public typealias RootCollectionListFields = CollectionListFields
	public typealias ChildCollectionListFields = CollectionListFields
	public typealias SystemCollectionListFields = CollectionCountFields

	public func listRootCollections() async -> Response<[CollectionListFields]> {
		await result {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Response<[CollectionListFields]> {
		await result {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Response<[CollectionCountFields]> {
		await result {
			try await collections.getSystemCollectionsCount().items
		}
	}

	public func deleteCollection(with id: Collection.ID) async -> Response<Void> {
		await result {
			try await collections.removeCollection(id: id)
		}
	}

	public func deleteCollections(with ids: [Collection.ID]) async -> Response<Void> {
		await result {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}
}
