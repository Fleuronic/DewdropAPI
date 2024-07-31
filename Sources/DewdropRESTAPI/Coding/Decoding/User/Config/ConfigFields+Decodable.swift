// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.ConfigFields

extension ConfigFields: @retroactive Decodable {
	enum CodingKeys: String, CodingKey {
		case lastViewedCollectionID = "lastCollection"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			config: .init(from: decoder),
			lastViewedCollectionID: container.decode(for: .lastViewedCollectionID)
		)
	}
}
