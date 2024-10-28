// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct DewdropService.BackupCreationDateFields
import struct Identity.Identifier

public typealias BackupsResponse = ItemListResponse<BackupCreationDateFields>
public typealias BackupFile = Data
