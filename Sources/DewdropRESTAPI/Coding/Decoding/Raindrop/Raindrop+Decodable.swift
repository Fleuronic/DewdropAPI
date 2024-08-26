// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.ItemType
import struct Dewdrop.Raindrop
import struct Dewdrop.Media
import struct Dewdrop.Tag
import struct Dewdrop.Cache
import struct Foundation.URL
import struct Foundation.Date

extension Raindrop: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
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
		
		try self.init(
			url: container.decode(for: .url),
			title: container.decode(for: .title),
			itemType: container.decode(for: .itemType),
			excerpt: container.decode(String.self, forKey: .excerpt).filledValue,
			domain: container.decode(for: .domain),
			coverURL: container.decode(String.self, forKey: .coverURL).filledValue.flatMap(URL.init(string:)),
			media: container.decode(for: .media),
			note: container.decode(String.self, forKey: .note).filledValue,
			cache: container.decodeIfPresent(for: .cache),
			isFavorite: container.decodeIfPresent(for: .isFavorite) ?? false,
			isBroken: container.decodeIfPresent(for: .isBroken) ?? false,
			creationDate: container.decode(for: .creationDate),
			updateDate: container.decode(for: .updateDate)
		)
	}
}
