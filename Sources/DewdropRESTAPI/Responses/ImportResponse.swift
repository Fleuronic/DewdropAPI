// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.IDFields
import struct DewdropService.InfoFields
import struct DewdropService.FolderFields
import protocol Identity.Identifiable

public typealias InfoResponse = ItemResponse<InfoFields>
public typealias ImportResponse = ListResponse<FolderFields>
public typealias RaindropIDListResponse = IDListResponse<Raindrop.Identified>
