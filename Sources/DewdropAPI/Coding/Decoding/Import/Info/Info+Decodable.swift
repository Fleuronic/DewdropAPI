// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.ItemType
import struct Dewdrop.Info
import struct Dewdrop.Media
import struct Foundation.URL

extension Info: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			title: try container.decode(String.self, forKey: .title),
			itemType: try container.decode(ItemType.self, forKey: .itemType),
			excerpt: try container.decode(String.self, forKey: .excerpt).filledValue,
			coverURL: try container.decode(URL.self, forKey: .coverURL),
			media: try container.decode([Media].self, forKey: .media)
		)
	}
}
