// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollectionDetailsFields
import struct DewdropService.CollectionCountFields
import protocol Identity.Identifiable

public typealias CollectionsResponse = ListResponse<CollectionDetailsFields>
public typealias SystemCollectionsResponse = ListResponse<CollectionCountFields>
