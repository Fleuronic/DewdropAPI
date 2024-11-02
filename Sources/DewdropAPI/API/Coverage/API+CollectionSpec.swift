// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	#if swift(<6.0)
	public typealias RootCollectionListFields = CollectionListFields
	public typealias ChildCollectionListFields = CollectionListFields
	public typealias SystemCollectionListFields = CollectionCountFields
	#endif

	public func listRootCollections() async -> Response<[CollectionListFields]> {
		await response {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Response<[CollectionListFields]> {
		await response {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Response<[CollectionCountFields]> {
		await response {
			try await collections.getSystemCollectionsCount().items
		}
	}

	public func deleteCollection(with id: Collection.ID) async -> Response<Void> {
		await response {
			try await collections.removeCollection(id: id)
		}
	}

	public func deleteCollections(with ids: [Collection.ID]) async -> Response<Void> {
		await response {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}
}
