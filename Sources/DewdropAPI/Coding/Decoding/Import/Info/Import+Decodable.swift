// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Import
import struct Dewdrop.Folder
import struct DewdropService.ImportFields

extension ImportFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			folders: try container.decode([Folder].self, forKey: .folders),
			count: try container.decode(Import.Count.self, forKey: .count)
		)
	}
}
