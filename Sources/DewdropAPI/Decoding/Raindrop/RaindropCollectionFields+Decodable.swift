// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropCollectionFields

extension RaindropCollectionFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(id: try container.decode(Int.self, forKey: .id))
	}
}

private extension RaindropCollectionFields {
	enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}
