// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.CollectionFields
import protocol Identity.Identifiable

public typealias CollectionResponse<Fields: CollectionFields & Decodable> = ItemResponse<Fields>
public typealias CollectionsResponse<Fields: CollectionFields & Decodable> = ItemListResponse<Fields>
public typealias SystemCollectionsCountResponse = ItemListResponse<CollectionCountFields>
public typealias CollaboratorsResponse = ItemListResponse<CollaboratorDetails>
