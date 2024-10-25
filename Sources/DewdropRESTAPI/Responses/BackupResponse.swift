// Copyright © Fleuronic LLC. All rights reserved.

public import struct Foundation.Data
public import struct DewdropService.BackupCreationDateFields
public import struct Identity.Identifier

public typealias BackupsResponse = ItemListResponse<BackupCreationDateFields>
public typealias BackupFile = Data
