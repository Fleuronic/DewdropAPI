// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.ItemType
import struct Dewdrop.Raindrop
import struct Dewdrop.Media
import struct Dewdrop.Tag
import struct Dewdrop.Cache
import struct Foundation.URL
import struct Foundation.Date

extension Raindrop: Decodable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		case itemType = "type"
		case excerpt
		case domain
		case coverURL = "cover"
		case media
		case note
		case cache
		case isFavorite = "important"
		case isBroken = "broken"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.init(
			url: try container.decode(for: .url),
			title: try container.decode(for: .title),
			itemType: try container.decode(for: .itemType),
			excerpt: try container.decode(String.self, forKey: .excerpt).filledValue,
			domain: try container.decode(for: .domain),
			coverURL: try container.decode(String.self, forKey: .coverURL).filledValue.flatMap(URL.init(string:)),
			media: try container.decode(for: .media),
			note: try container.decode(String.self, forKey: .note).filledValue,
			cache: try container.decodeIfPresent(for: .cache),
			isFavorite: try container.decodeIfPresent(for: .isFavorite) ?? false,
			isBroken: try container.decodeIfPresent(for: .isBroken) ?? false,
			creationDate: try container.decode(for: .creationDate),
			updateDate: try container.decode(for: .updateDate)
		)
	}
}
