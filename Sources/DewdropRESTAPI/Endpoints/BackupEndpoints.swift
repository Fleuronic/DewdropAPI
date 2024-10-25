// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

public import enum Dewdrop.FileFormat
public import struct Dewdrop.Backup
public import struct DewdropService.IdentifiedBackup

@API @JSON(decoder: .dewdrop)
public protocol BackupEndpoints {
	@GET("/backups")
	func getAll() async throws -> BackupsResponse
	
	@GET("/backup")
	func generateNew() async throws -> String

	@GET("/backup/{id}/{format}")
	func downloadFile(id: Backup.ID, format: FileFormat) async throws -> BackupFile
}
