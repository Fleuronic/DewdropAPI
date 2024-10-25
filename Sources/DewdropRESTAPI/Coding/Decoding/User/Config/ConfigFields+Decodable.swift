// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.ConfigFields

extension ConfigFields: Swift.Decodable {
	enum CodingKeys: String, CodingKey {
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
