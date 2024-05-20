// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct DewdropService.BackupCreationDateFields
import protocol Identity.Identifiable

public typealias BackupsResponse = ListResponse<BackupCreationDateFields>
public typealias BackupFile = Data
