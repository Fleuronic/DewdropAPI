// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoParseFields
import protocol DewdropService.ImportFields
import protocol Identity.Identifiable

public typealias InfoResponse = ItemResponse<InfoParseFields>
public typealias ImportResponse<Fields: ImportFields & Decodable> = Fields
public typealias RaindropIDListResponse = IDListResponse<Raindrop.Identified>
