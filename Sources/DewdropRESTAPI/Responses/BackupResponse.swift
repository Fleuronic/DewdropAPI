// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct DewdropService.BackupCreationDateFields
import protocol Identity.Identifiable

public typealias BackupsResponse = ItemListResponse<BackupCreationDateFields>
public typealias BackupFile = Data
