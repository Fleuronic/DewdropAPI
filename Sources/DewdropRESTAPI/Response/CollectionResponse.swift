// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Dewdrop.Collaborator
import protocol DewdropService.CollectionFields
import protocol Identity.Identifiable

public typealias CollectionResponse<Fields: CollectionFields & Decodable> = ItemResponse<Fields>
public typealias CollectionsResponse<Fields: CollectionFields & Decodable> = ItemListResponse<Fields>
public typealias SystemCollectionsCountResponse = ItemListResponse<CollectionCountFields>
public typealias EmptyCollectionsRemovalResponse = EmptyCollectionRemovalFields
public typealias CollectionsRemovalResponse = CollectionModificationFields
public typealias CollaboratorsResponse = ItemListResponse<CollaboratorDetails>
public typealias CollaboratorRoleResponse = ItemResponse<CollaboratorRoleFields>
public typealias CoverResponse = ItemResponse<Collection.Cover>
public typealias CoversResponse = ItemListResponse<Collection.Cover>
