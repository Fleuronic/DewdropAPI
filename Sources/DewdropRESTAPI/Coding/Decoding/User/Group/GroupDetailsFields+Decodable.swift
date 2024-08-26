// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.GroupDetailsFields

extension GroupDetailsFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case collections		
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			group: .init(from: decoder),
			collectionIDs: container.decode(for: .collections)
		)
	}
}
