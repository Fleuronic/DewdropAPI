// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Cover.IconSet: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			png: try container.decodeIfPresent(for: .png),
			svg: try container.decodeIfPresent(for: .svg)
		)
	}
}
