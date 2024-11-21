// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropRESTAPI.BackupDetails
import struct Foundation.Data
import struct Identity.Identifier
import protocol DewdropService.BackupSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: BackupSpec {
	#if swift(<6.0)
	public typealias BackupListFields = BackupSpecifiedFields
	#endif

	public func listBackups() async -> Results<BackupSpecifiedFields> {
		await results {
			try await backups.getAll().items
		}
	}
	
	public func createBackup(using creator: Self) async -> SingleResult<String> {
		await result {
			try await backups.generateNew().message
		}
	}
	
	public func downloadBackup(with id: Backup.ID, as format: FileFormat) async -> SingleResult<Data> {
		await result {
			try await backups.downloadFile(
				id: id,
				format: format
			)
		}
	}
}

// MARK: -
public extension API {
	func createBackup() async -> SingleResult<String> {
		await createBackup(using: self)
	}
}
