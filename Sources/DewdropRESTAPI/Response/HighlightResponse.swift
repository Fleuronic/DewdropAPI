// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.HighlightFields
import protocol DewdropService.RaindropFields
import protocol Identity.Identifiable

public typealias HighlightsResponse<Fields: HighlightFields & Decodable> = ItemListResponse<Fields>
public typealias RaindropHighlightsResponse<Fields: RaindropFields & Decodable> = ItemResponse<Fields>
