// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.ItemType
import struct Dewdrop.Raindrop
import struct Dewdrop.Media
import struct Dewdrop.Tag
import struct Dewdrop.Cache
import struct Foundation.URL
import struct Foundation.Date

extension Raindrop: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.init(
			url: try container.decode(URL.self, forKey: .url),
			title: try container.decode(String.self, forKey: .title),
			itemType: try container.decode(ItemType.self, forKey: .itemType),
			excerpt: try container.decode(String.self, forKey: .excerpt).filledValue,
			domain: try container.decode(String.self, forKey: .domain),
			coverURL: try container.decode(String.self, forKey: .coverURL).filledValue.flatMap(URL.init),
			media: try container.decode([Media].self, forKey: .media),
			note: try container.decode(String.self, forKey: .note).filledValue,
			cache: try container.decodeIfPresent(Cache.self, forKey: .cache),
			isFavorite: try container.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false,
			isBroken: try container.decode(Bool.self, forKey: .isBroken),
			creationDate: try container.decode(Date.self, forKey: .creationDate),
			updateDate: try container.decode(Date.self, forKey: .updateDate)
		)
	}
}
