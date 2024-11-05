// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	#if swift(<6.0)
	public typealias RootCollectionListFields = CollectionResponseFields
	public typealias ChildCollectionListFields = CollectionResponseFields
	public typealias SystemCollectionListFields = CollectionCountFields
	#endif

	public func listRootCollections() async -> Response<[CollectionResponseFields]> {
		await response {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Response<[CollectionResponseFields]> {
		await response {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Response<[CollectionCountFields]> {
		await response {
			try await collections.getSystemCollectionsCount().items
		}
	}

	@discardableResult
	public func deleteCollection(with id: Collection.ID) async -> Response<Void> {
		await response {
			try await collections.removeCollection(id: id)
		}
	}

	@discardableResult
	public func deleteCollections(with ids: [Collection.ID]) async -> Response<Void> {
		await response {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}
}
