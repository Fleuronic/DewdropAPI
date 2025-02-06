// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Dewdrop.Backup
import struct DewdropService.IdentifiedBackup

@API @Mock @JSON(decoder: DewdropDecoder())
public protocol BackupEndpoints {
	init(provider: Provider)

	@GET("/backups")
	func getAll<Fields>() async throws -> BackupsResponse<Fields>

	@GET("/backup")
	func generateNew() async throws -> BackupGenerationResponse

	@GET("/backup/{id}/{format}")
	func downloadFile(id: Backup.ID, format: Backup.FileFormat) async throws -> Data
}

// MARK: -
public extension BackupEndpointsMock {
	convenience init(provider: Provider) {
		self.init()
	}
}
