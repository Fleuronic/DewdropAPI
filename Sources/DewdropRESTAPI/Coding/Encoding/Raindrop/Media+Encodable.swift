// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Media
import struct Foundation.URL

extension Media: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		try container.encode(url, forKey: .url)
	}
}
