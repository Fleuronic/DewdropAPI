// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import struct Identity.Identifier
import protocol DewdropService.BackupFields

public typealias BackupsResponse<Fields: BackupFields & Decodable> = ItemListResponse<Fields>

// MARK: -
public struct BackupGenerationResponse {
	public let result: Bool
	public let message: String
}

// MARK: -
extension BackupGenerationResponse: Response {
	public typealias Item = String
}
