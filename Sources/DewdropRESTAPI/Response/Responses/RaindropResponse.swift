// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.RaindropFields
import protocol Identity.Identifiable

public typealias RaindropResponse<Fields: RaindropFields & Decodable> = ItemResponse<Fields>
public typealias RaindropsResponse<Fields: RaindropFields & Decodable> = ItemListResponse<Fields>
