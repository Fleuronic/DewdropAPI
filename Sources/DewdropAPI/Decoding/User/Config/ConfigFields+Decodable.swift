// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.ConfigFields

extension ConfigFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			config: try .init(from: decoder),
			lastViewedCollectionID: try container.decode(Collection.ID.self, forKey: .lastViewedCollectionID)
		)
	}
}

private extension ConfigFields {
	enum CodingKeys: String, CodingKey {
		case lastViewedCollectionID = "lastCollection"
	}
}
