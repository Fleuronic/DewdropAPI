// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.IdentifiedBackup

@API @JSON(decoder: .dewdrop)
public protocol BackupEndpoints {
	@GET("/backups")
	func getAll() async throws -> Backups
	
	@GET("/backup")
	func generateNew() async throws -> String

	@GET("/backup/:id/:format/")
	func downloadFile(id: Backup.ID, format: FileFormat) async throws -> BackupFile
}
