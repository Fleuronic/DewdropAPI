// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.ImportFolderFields

@AutoDecodable(accessControl: .public)
extension ImportFolderFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
	}
}
