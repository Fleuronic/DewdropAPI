// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoParseFields
import struct DewdropService.ImportFolderAndCountFields
import protocol Identity.Identifiable

public typealias InfoResponse = ItemResponse<InfoParseFields>
public typealias ImportResponse = ImportFolderAndCountFields
public typealias RaindropIDListResponse = IDListResponse<Raindrop.Identified>
