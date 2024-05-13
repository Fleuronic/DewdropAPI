// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct DewdropService.BackupListFields
import protocol Identity.Identifiable

public typealias Backups = ListResponse<BackupListFields>
public typealias BackupFile = Data
