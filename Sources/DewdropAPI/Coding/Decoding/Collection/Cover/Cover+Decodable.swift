// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection.Cover: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			title: try container.decode(String.self, forKey: .title),
			iconSets: try container.decode([IconSet].self, forKey: .iconSets)
		)
	}
}
