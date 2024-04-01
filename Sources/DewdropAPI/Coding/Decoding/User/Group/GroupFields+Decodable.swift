// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.GroupFields

extension GroupFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			group: try .init(from: decoder),
			collectionIDs: try container.decode([Collection.ID].self, forKey: .collections)
		)
	}
}
