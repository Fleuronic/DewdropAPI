// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionCountFields

extension CollectionCountFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			id: try container.decode(Collection.ID.self, forKey: .id),
			count: try container.decode(Int.self, forKey: .count)
		)
	}
}
