// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionCountFields
import protocol DewdropService.CollectionFields
import protocol Identity.Identifiable

public typealias CollectionsResponse<Fields: CollectionFields & Decodable> = ItemListResponse<Fields>
public typealias SystemCollectionsCountResponse = ItemListResponse<CollectionCountFields>
