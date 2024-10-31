// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.BackupCreationDateFields
import struct Foundation.Data
import struct Identity.Identifier
import protocol DewdropService.BackupSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: BackupSpec {
	// TODO: Remove
	public typealias BackupListFields = BackupCreationDateFields

	public func listBackups() async -> Response<[BackupCreationDateFields]> {
		await response {
			try await backups.getAll().items
		}
	}
	
	public func createBackup() async -> Response<String> {
		await response {
			try await backups.generateNew()
		}
	}
	
	public func downloadBackup(with id: Backup.ID, as format: FileFormat) async -> Response<Data> {
		await response {
			try await backups.downloadFile(
				id: id,
				format: format
			)
		}
	}
}
