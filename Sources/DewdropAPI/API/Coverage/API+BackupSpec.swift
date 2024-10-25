// Copyright © Fleuronic LLC. All rights reserved.

public import enum Dewdrop.FileFormat
public import struct Dewdrop.Backup
public import struct DewdropService.BackupCreationDateFields
public import struct Foundation.Data
public import struct Identity.Identifier
public import protocol DewdropService.BackupSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

extension API: BackupSpec {
	// TODO: Remove
	public typealias BackupListFields = BackupCreationDateFields

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
