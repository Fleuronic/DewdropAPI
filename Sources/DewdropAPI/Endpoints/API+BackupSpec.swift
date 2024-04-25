// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.BackupFields
import struct Foundation.Data
import protocol DewdropService.BackupSpec
import protocol Catena.API

extension API: BackupSpec {
	public func listBackups() async -> Self.Result<[BackupFields]> {
		let path = "backups"
		return await getResource(at: path)
	}
	
	public func generateNewBackup() async -> Self.Result<String> {
		let path = "backup"
		return await getResource(at: path)
	}
	
	public func downloadFile(forBackupWith id: Backup.ID, as format: FileFormat) async -> Self.Result<Data> {
		let path = "backup/\(id).\(format.extension)"
		return await getResource(at: path)
	}
}

