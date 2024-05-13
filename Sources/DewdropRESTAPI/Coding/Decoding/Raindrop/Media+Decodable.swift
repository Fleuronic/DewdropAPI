// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Media
import struct Foundation.URL

extension Media: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(url: try container.decode(URL.self, forKey: .url))
	}
}
