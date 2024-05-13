// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Folder

extension Folder: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(title: try container.decode(String.self, forKey: .title))
	}
}
