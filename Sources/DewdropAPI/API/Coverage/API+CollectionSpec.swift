// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropRESTAPI.CollectionCountFields
import struct DewdropRESTAPI.CollaboratorDetails
import struct Identity.Identifier
import protocol DewdropService.CollectionSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CollectionSpec {
	#if swift(<6.0)
	public typealias RootCollectionListFields = CollectionResultFields
	public typealias ChildCollectionListFields = CollectionResultFields
	public typealias SystemCollectionListFields = CollectionCountFields
	#endif

	public func fetchCollection(with id: Collection.ID) async -> SingleResult<CollectionResultFields> {
		await result {
			try await collections.getCollection(id: id).item
		}
	}

	public func listRootCollections() async -> Results<CollectionResultFields> {
		await results {
			try await collections.getRootCollections().items
		}
	}

	public func listChildCollections() async -> Results<CollectionResultFields> {
		await results {
			try await collections.getChildCollections().items
		}
	}

	public func listSystemCollections() async -> Results<CollectionCountFields> {
		await results {
			try await collections.getSystemCollectionsCount().items
		}
	}

	public func listCollaborators(ofCollectionWith id: Collection.ID) async -> Results<CollaboratorDetails> {
		await results {
			try await collections.getCollaboratorsList(id: id).items
		}
	}

	public func removeCollection(with id: Collection.ID) async -> NoResult {
		await result {
			try await collections.removeCollection(id: id)
		}
	}

	public func removeCollections(with ids: [Collection.ID]) async -> NoResult {
		await result {
			try await collections.removeMultipleCollections(ids: ids)
		}
	}

	public func emptyTrash() async -> NoResult {
		await removeCollection(with: .trash)
	}
}
