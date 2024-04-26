// Copyright © Fleuronic LLC. All rights reserved.

import Catena

import enum Dewdrop.FileFormat
import struct Dewdrop.Backup
import struct DewdropService.BackupFields
import struct Foundation.Data
import protocol DewdropService.BackupSpec

extension API: BackupSpec {
	public func listBackups() async -> Self.Result<[BackupFields]> {
		await get(/.backups)
	}
	
	public func generateNewBackup() async -> Self.Result<String> {
		await get(/.backup)
	}
	
	public func downloadFile(forBackupWith id: Backup.ID, as format: FileFormat) async -> Self.Result<Data> {
		await get(/.backup, /id, /format)
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case backup
	case backups
}

// MARK: -
private prefix func /(component: PathComponents) -> PathComponent { component }
