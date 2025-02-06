// Copyright © Fleuronic LLC. All rights reserved.

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
			try await backupEndpoints.getAll().items
		}
	}
	
	public func createBackup(using method: Self) async -> SingleResult<String> {
		await result {
			try await backupEndpoints.generateNew().message
		}
	}
	
	public func downloadBackup(with id: Backup.ID, as format: Backup.FileFormat) async -> SingleResult<Data> {
		await result {
			try await backupEndpoints.downloadFile(
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
