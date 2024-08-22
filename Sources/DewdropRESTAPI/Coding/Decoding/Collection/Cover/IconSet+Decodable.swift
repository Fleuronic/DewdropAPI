// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL

extension Collection.Cover.IconSet: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			png: try container.decodeIfPresent(URL.self, forKey: .png),
			svg: try container.decodeIfPresent(URL.self, forKey: .svg)
		)
	}
}
