// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoParseFields
import struct DewdropService.ImportFolderCountFields
import protocol Identity.Identifiable

public typealias InfoResponse = ItemResponse<InfoParseFields>
public typealias ImportResponse = ImportFolderCountFields
public typealias RaindropIDListResponse = IDListResponse<Raindrop.Identified>
