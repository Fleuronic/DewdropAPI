// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.GroupFields

extension GroupFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case group
		case collections		
	}

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self = .init(
			group: try .init(from: decoder),
			collectionIDs: try container.decode(for: .collections)
		)
	}
}
