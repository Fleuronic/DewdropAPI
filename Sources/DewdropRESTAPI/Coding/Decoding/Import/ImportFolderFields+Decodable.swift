// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.ImportFolderFields

@AutoDecodable(accessControl: .public)
extension ImportFolderFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
	}
}
