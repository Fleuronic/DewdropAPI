// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
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
			excerpt: try container.decode(String.self, forKey: .excerpt),
			domain: try container.decode(String.self, forKey: .domain),
			coverURL: try container.decode(URL.self, forKey: .coverURL),
			note: try container.decode(String.self, forKey: .note),
			tags: try container.decode([String].self, forKey: .tags),
			cache: try container.decode(Cache.self, forKey: .cache),
			isFavorite: try container.decode(Bool.self, forKey: .isFavorite),
			isBroken: try container.decode(Bool.self, forKey: .isBroken),
			creationDate: try container.decode(Date.self, forKey: .creationDate),
			updateDate: try container.decode(Date.self, forKey: .updateDate)
		)
	}
}

// MARK -
private extension Raindrop {
	enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		case itemType = "type"
		case excerpt
		case domain
		case coverURL = "cover"
		case note
		case tags
		case cache
		case isFavorite = "important"
		case isBroken = "broken"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}
}
