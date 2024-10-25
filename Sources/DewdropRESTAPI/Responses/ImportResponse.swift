// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Raindrop
public import struct DewdropService.InfoParseFields
public import struct DewdropService.ImportFolderCountFields
import protocol Identity.Identifiable

public typealias InfoResponse = ItemResponse<InfoParseFields>
public typealias ImportResponse = ImportFolderCountFields
public typealias RaindropIDListResponse = IDListResponse<Raindrop.Identified>
