// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropSuggestionsFields

extension RaindropSuggestionsFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case collections
		case tags
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			collections: try container.decode(for: .collections),
			tags: try container.decode(for: .tags)
		)
	}
}
