// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop

extension Raindrop.Reminder: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case date
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(date: container.decode(for: .date))
	}
}
