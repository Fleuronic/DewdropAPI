// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.BackupCreationDateFields
import struct PapyrusCore.PapyrusError
import struct Foundation.Data
import struct Identity.Identifier
import protocol DewdropService.BackupSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: BackupSpec {
	public func listBackups() async -> Self.Result<[BackupCreationDateFields]> {
		await result {
			try await backups.getAll().items 
		}
	}
	
	public func createBackup() async -> Self.Result<String> {
		await result { 
			try await backups.generateNew() 
		}
	}
	
	public func downloadBackup(with id: Backup.ID, as format: FileFormat) async -> Self.Result<Data> {
		await result {
			try await backups.downloadFile(
				id: id,
				format: format
			)
		}
	}
}
