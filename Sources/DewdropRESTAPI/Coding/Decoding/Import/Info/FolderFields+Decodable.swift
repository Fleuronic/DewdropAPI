// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.FolderFields

@AutoDecodable(accessControl: .public)
extension FolderFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case bookmarks
		case folders
	}
}
