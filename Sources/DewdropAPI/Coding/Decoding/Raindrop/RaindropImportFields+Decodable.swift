// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Media
import struct DewdropService.RaindropImportFields
import struct DewdropService.TagNameFields
import struct DewdropService.HighlightImportFields
import struct Foundation.URL
import struct Foundation.Date

extension RaindropImportFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			url: try container.decode(URL.self, forKey: .url),
			title: try container.decode(String.self, forKey: .title),
			excerpt: try container.decode(String.self, forKey: .excerpt).filledValue,
			coverURL: try container.decode(String.self, forKey: .coverURL).filledValue.flatMap(URL.init),
			media: try container.decode([Media].self, forKey: .media),
			note: try container.decode(String.self, forKey: .note).filledValue,
			isFavorite: try container.decode(Bool.self, forKey: .isFavorite),
			creationDate: try container.decode(Date.self, forKey: .creationDate),
			updateDate: try container.decode(Date.self, forKey: .updateDate),
			tags: try container.decode([TagNameFields].self, forKey: .tags),
			highlights: try container.decodeIfPresent([HighlightImportFields].self, forKey: .highlights)
		)
	}
}
