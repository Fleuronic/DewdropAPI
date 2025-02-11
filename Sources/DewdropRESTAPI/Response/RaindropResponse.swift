// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol DewdropService.RaindropFields
import protocol Identity.Identifiable

public typealias RaindropResponse<Fields: RaindropFields & Decodable> = ItemResponse<Fields>
public typealias RaindropsResponse<Fields: RaindropFields & Decodable> = ItemListResponse<Fields>
public typealias RaindropSuggestionsResponse = ItemResponse<RaindropSuggestionsFields>
public typealias RaindropsRemovalResponse = RaindropModificationFields
