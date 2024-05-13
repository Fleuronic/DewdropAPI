// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.FolderFields
import struct DewdropService.RaindropImportFields

extension FolderFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			title: try container.decode(String.self, forKey: .title),
			bookmarks: try container.decode([RaindropImportFields].self, forKey: .bookmarks),
			folders: try container.decode([FolderFields].self, forKey: .folders)
		)
	}
}
