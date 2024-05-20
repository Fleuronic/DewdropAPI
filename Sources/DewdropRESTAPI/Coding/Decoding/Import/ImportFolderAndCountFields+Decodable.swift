// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.ImportFolderAndCountFields
import struct DewdropService.FolderImportFields

@AutoDecodable(accessControl: .public)
extension ImportFolderAndCountFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
		@Conditional case count
	}
}
