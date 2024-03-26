// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Access: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			level: try container.decode(Level.self, forKey: .level),
			isDraggable: try container.decode(Bool.self, forKey: .isDraggable)
		)
	}
}

private extension Collection.Access {
	enum CodingKeys: String, CodingKey {
		case level
		case isDraggable = "draggable"
	}
}
