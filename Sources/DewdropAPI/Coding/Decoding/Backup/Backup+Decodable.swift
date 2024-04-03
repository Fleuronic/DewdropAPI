// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Backup
import struct Foundation.Date

extension Backup: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(creationDate: try container.decode(Date.self, forKey: .creationDate))
	}
}
