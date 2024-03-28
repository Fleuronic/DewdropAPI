// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Group

extension Group: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			title: try container.decode(String.self, forKey: .title),
			isHidden: try container.decode(Bool.self, forKey: .isHidden),
			sortIndex: try container.decode(Int.self, forKey: .sortIndex)
		)
	}
}

// MARK -
private extension Group {
	enum CodingKeys: String, CodingKey {
		case title
		case isHidden = "hidden"
		case sortIndex = "sort"
	}
}
