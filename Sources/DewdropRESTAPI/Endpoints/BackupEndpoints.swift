// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Backup
import struct DewdropService.IdentifiedBackup

@API @JSON(decoder: .dewdrop)
public protocol BackupEndpoints {
	@GET("/backups")
	func getAll<Fields>() async throws -> BackupsResponse<Fields>

	@GET("/backup")
	func generateNew() async throws -> BackupGenerationResponse

	@GET("/backup/{id}/{format}")
	func downloadFile(id: Backup.ID, format: Backup.FileFormat) async throws -> Data
}
