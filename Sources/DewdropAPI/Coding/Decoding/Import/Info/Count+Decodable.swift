// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Import

extension Import.Count: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			bookmarks: try container.decode(Int.self, forKey: .bookmarks),
			folders: try container.decode(Int.self, forKey: .folders),
			tags: try container.decode(Int.self, forKey: .tags),
			highlights: try container.decode(Int.self, forKey: .highlights)
		)
	}
}
