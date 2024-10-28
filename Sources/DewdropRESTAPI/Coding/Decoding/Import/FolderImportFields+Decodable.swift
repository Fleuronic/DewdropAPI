// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.FolderImportFields

extension FolderImportFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case bookmarks
		case subfolders = "folders"
	}
	
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			bookmarks: container.decode(for: .bookmarks),
			subfolders: container.decode(for: .subfolders),
			folder: .init(from: decoder)
		)
	}
}
