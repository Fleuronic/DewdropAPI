// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.ConfigFields

extension ConfigFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case lastViewedCollectionID = "lastCollection"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			config: .init(from: decoder),
			lastViewedCollectionID: container.decode(for: .lastViewedCollectionID)
		)
	}
}
