// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.RaindropSuggestionListFields
import struct DewdropService.TagNameFields
import struct Catena.IDFields


extension RaindropSuggestionListFields: @retroactive Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			collections: try container.decode([IDFields<Collection.Identified>].self, forKey: .collections),
			tags: try container.decode([TagNameFields].self, forKey: .tags)
		)
	}
}
