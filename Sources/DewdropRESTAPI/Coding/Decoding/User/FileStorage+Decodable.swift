// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.FileStorage
import struct Foundation.Date

extension FileStorage: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			usedSpace: try container.decode(Int.self, forKey: .usedSpace),
			totalSpace: try container.decode(Int.self, forKey: .totalSpace),
			lastCheckpointDate: try container.decode(Date.self, forKey: .lastCheckpointDate)
		)
	}
}
