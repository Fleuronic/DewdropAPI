// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag

extension Tag: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(count: try container.decode(Int.self, forKey: .count))
	}
}

private extension Tag {
	enum CodingKeys: String, CodingKey {
		case count
	}
}
