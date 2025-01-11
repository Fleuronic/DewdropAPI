// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol DewdropService.CollectionFields
import protocol Identity.Identifiable

public typealias CollectionResponse<Fields: CollectionFields & Decodable> = ItemResponse<Fields>
public typealias CollectionsResponse<Fields: CollectionFields & Decodable> = ItemListResponse<Fields>
public typealias SystemCollectionsCountResponse = ItemListResponse<CollectionCountFields>
public typealias EmptyCollectionRemovalResponse = EmptyCollectionRemovalFields
public typealias CollaboratorsResponse = ItemListResponse<CollaboratorDetails>
public typealias CollaboratorRoleResponse = ItemResponse<CollaboratorRoleFields>
public typealias CollaboratorEmailsResponse = ItemResponse<CollaboratorEmailsFields>
public typealias CoversResponse = ItemListResponse<Collection.Cover>
