// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.BackupListFields
import struct PapyrusCore.PapyrusError
import struct Foundation.Data
import protocol DewdropService.BackupSpec

extension API: BackupSpec {
	public func listBackups() async -> Result<[BackupListFields]> {
		await result { 
			try await backups.getAll().items 
		}
	}
	
	public func createBackup() async -> Result<String> {
		await result { 
			try await backups.generateNew() 
		}
	}
	
	public func downloadBackup(with id: Backup.ID, as format: FileFormat) async -> Result<Data> {
		await result {
			try await backups.downloadFile(
				id: id,
				format: format
			)
		}
	}
}
