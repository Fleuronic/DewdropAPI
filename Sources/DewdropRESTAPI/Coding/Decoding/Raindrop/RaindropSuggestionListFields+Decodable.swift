// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropSuggestionListFields
import struct DewdropService.TagNameFields
import struct Dewdrop.Collection
import struct Catena.IDFields

extension RaindropSuggestionListFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			collections: try container.decode(for: .collections),
			tags: try container.decode(for: .tags)
		)
	}
}
