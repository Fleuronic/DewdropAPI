// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropRESTAPI.CollectionCountFields
import struct DewdropRESTAPI.EmptyCollectionRemovalFields
import struct Identity.Identifier
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	#if swift(<6.0)
	public typealias CollectionFetchFields = CollectionSpecifiedFields
	public typealias RootCollectionListFields = CollectionSpecifiedFields
	public typealias ChildCollectionListFields = CollectionSpecifiedFields
	public typealias SystemCollectionListFields = CollectionCountFields
	#endif

	public func fetchCollection(with id: Collection.ID) async -> SingleResult<CollectionSpecifiedFields> {
		await result {
			try await collections.getCollection(id: id).item
		}
	}

	public func listRootCollections() async -> Results<CollectionSpecifiedFields> {
		await results {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Results<CollectionSpecifiedFields> {
		await results {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Results<CollectionCountFields> {
		await results {
			try await users.getSystemCollectionsCount().items
		}
	}

	public func removeCollection(with id: Collection.ID) async -> EmptyResult {
		await result {
			try await collections.removeCollection(id: id)
		}
	}

	public func removeCollections(with ids: [Collection.ID]) async -> EmptyResult {
		await result {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}

	public func removeEmptyCollections() async -> SingleResult<EmptyCollectionRemovalFields> {
		await result {
			try await collections.removeAllEmptyCollections()
		}
	}

	public func emptyTrash() async -> EmptyResult {
		await removeCollection(with: .trash)
	}
}
