// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
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

	public func listSystemCollections() async -> Self.Result<[CollectionCountFields]> {
		await result {
			try await collections.getSystemCollectionsCount().items
		}
	}

	public func deleteCollection(with id: Collection.ID) async -> Self.Result<Void> {
		await result {
			try await collections.removeCollection(id: id)
		}
	}

	public func deleteCollections(with ids: [Collection.ID]) async -> Self.Result<Void> {
		await result {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}
}
