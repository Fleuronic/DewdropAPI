// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Import
import struct Dewdrop.Folder
import struct DewdropService.ImportFields
import struct DewdropService.FolderFields

extension ImportFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			items: try container.decode([FolderFields].self, forKey: .items),
			count: try container.decode(Import.Count.self, forKey: .count)
		)
	}
}
