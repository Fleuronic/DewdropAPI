// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Foundation.URL

extension Raindrop: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case url = "link"
		case domain
		case note
		case media
		case cache
		case reminder
		case isFavorite = "important"
		case isBroken = "broken"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			url: container.decode(for: .url),
			domain: container.decode(for: .domain),
			info: .init(from: decoder),
			note: container.decode(String.self, forKey: .note).filledValue,
			media: container.decode(for: .media),
			cache: container.decodeIfPresent(for: .cache),
			reminder: try? container.decode(for: .reminder),
			isFavorite: container.decodeIfPresent(for: .isFavorite) ?? false,
			isBroken: container.decodeIfPresent(for: .isBroken) ?? false,
			creationDate: container.decode(for: .creationDate),
			updateDate: container.decode(for: .updateDate)
		)
	}
}
