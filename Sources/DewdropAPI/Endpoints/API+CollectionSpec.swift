// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
import struct Dewdrop.User
import struct DewdropService.CollectionFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import struct DewdropService.CollectionMergeFields
import struct DewdropService.CountFields
import struct DewdropService.CollaboratorFields
import struct DewdropService.CollaboratorEmailListFields
import struct DewdropService.CollaboratorRoleFields
import struct DewdropService.CoverFields
import struct Foundation.URL
import protocol DewdropService.CollectionSpec

extension API: CollectionSpec {
	public func listRootCollections() async -> Self.Result<[CollectionFields]> {
		await get(/.collections)
	}

	public func listChildCollections() async -> Self.Result<[CollectionFields]> {
		await get(/.collections, /.children)
	}

	public func listSystemCollections() async -> Self.Result<[CollectionCountFields]> {
		await get(/.import, /.url, /.parse)
	}

	public func fetchDetails(forCollectionWith id: Collection.ID) async -> Self.Result<CollectionDetailsFields> {
		await get(/.collection, /id)
	}
	
	public func uploadCover(forCollectionWith id: Collection.ID, usingFileAt url: URL, withName filename: String) async -> Self.Result<CollectionFields> {
		await put(/.collection, /id, /.cover, upload: {
			Upload(
				url: url,
				name: "cover",
				filename: filename
			)
		})
	}

	public func listCollaborators(ofCollectionWith id: Collection.ID) async -> Self.Result<[CollaboratorFields]> {
		await get(/.collection, /id, /.sharing)
	}
	
	public func expandCollections(_ expanded: Bool) async -> Self.Result<Void> {
		await put(/.collections, parameters: {
			CollectionExpansionParameters(expanded: expanded)
		})
	}
	
	public func createCollection(
		title: String? = nil,
		coverURL: URL? = nil,
		public: Bool? = nil,
		view: Collection.View? = nil,
		sortIndex: Int? = nil,
		parentID: Collection.ID? = nil
	) async -> Self.Result<CollectionDetailsFields> {
		await post(/.collection) {
			CollectionPayload(
				title: title,
				coverURL: coverURL,
				public: `public`,
				view: view,
				sortIndex: sortIndex,
				expanded: nil,
				parentID: parentID
			)
		}
	}
	
	public func updateCollection(
		with id: Collection.ID,
		title: String? = nil,
		coverURL: URL? = nil,
		public: Bool? = nil,
		view: Collection.View? = nil,
		sortIndex: Int? = nil,
		expanded: Bool? = nil,
		parentID: Collection.ID? = nil
	) async -> Self.Result<CollectionDetailsFields> {
		await put(/.collection, /id) {
			CollectionPayload(
				title: title,
				coverURL: coverURL,
				public: `public`,
				view: view,
				sortIndex: sortIndex,
				expanded: expanded,
				parentID: parentID
			)
		}
	}
	
	public func unshareLeaveCollection(with id: Collection.ID) async -> Self.Result<Void> {
		await delete(/.collection, /id, /.sharing)
	}
	
	public func removeCollaborator(with id: User.ID, fromCollectionWith collectionID: Collection.ID) async -> Self.Result<Void> {
		await delete(/.collection, /collectionID, /.sharing, /id)
	}
	
	public func removeCollection(with id: Collection.ID) async -> Self.Result<Void> {
		await delete(/.collection, /id)
	}
	
	public func removeCollections(with ids: [Collection.ID]) async -> Self.Result<Void> {
		await delete(/.collections) {
			CollectionRemovalPayload(ids: ids)
		}
	}
	
	public func removeEmptyCollections() async -> Self.Result<CountFields> {
		await put(/.collections, /.clean)
	}

	public func emptyTrash() async -> Self.Result<Void> {
		await removeCollection(with: .trash)
	}

	public func searchForCovers(with text: String) async -> Self.Result<[CoverFields]> {
		await get(/.collections, /.covers, /text)
	}

	public func listFeaturedCovers() async -> Self.Result<[CoverFields]> {
		await get(/.collections, /.covers)
	}
	
	public func reorderCollections(by sort: Collection.Sort) async -> Self.Result<Void> {
		await put(/.collections) {
			CollectionReorderPayload(sort: sort)
		}
	}
	
	public func mergeCollections(with ids: [Collection.ID], intoCollectionWith id: Collection.ID) async -> Self.Result<CollectionMergeFields> {
		await put(/.collections, /.merge) {
			CollectionMergePayload(
				sourceIDs: ids,
				destinationID: id
			)
		}
	}
	
	public func shareCollection(with id: Collection.ID, toUsersWithEmails emails: [String], as role: Collaborator.Role) async -> Self.Result<CollaboratorEmailListFields> {
		await post(/.collections, /id, /.sharing) {
			CollectionSharePayload(
				role: role,
				emails: emails
			)
		}
	}
	
	public func acceptInvitation(toJoinCollectionWith id: Collection.ID, viaEmailWithToken token: String) async -> Self.Result<CollaboratorRoleFields> {
		await post(/.collections, /id, /.join) {
			CollectionJoinPayload(token: token)
		}
	}
	
	public func changeAccessLevelOfCollaborator(with id: User.ID, inCollectionWith collectionID: Collection.ID, to role: Collaborator.Role) async -> Self.Result<Void> {
		await put(/.collection, /collectionID, /.sharing, /id) {
			CollaboratorUpdatePayload(role: role)
		}
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case collection
	case collections
	case children = "childrens"
	case `import`
	case url
	case cover
	case covers
	case parse
	case sharing
	case clean
	case join
	case merge
}

private prefix func /(component: PathComponents) -> PathComponent { component }
