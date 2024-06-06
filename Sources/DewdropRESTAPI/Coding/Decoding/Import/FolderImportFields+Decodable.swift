// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.FolderImportFields
import struct DewdropService.RaindropImportFields

extension FolderImportFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case bookmarks
		case subfolders = "folders"
	}
	
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			bookmarks: try container.decode(for: .bookmarks),
			subfolders: try container.decode(for: .subfolders),
			folder: try .init(from: decoder)
		)
	}
}