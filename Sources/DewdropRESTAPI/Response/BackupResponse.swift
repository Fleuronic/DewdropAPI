// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct Identity.Identifier

public typealias BackupsResponse = ItemListResponse<BackupCreationDateFields>

// MARK: -
public struct BackupGenerationResponse {
	public let result: Bool
	public let message: String
}

// MARK: -
extension BackupGenerationResponse: Response {
	public typealias Item = String
}
