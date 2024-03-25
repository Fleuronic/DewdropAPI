// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.init(
			title: try container.decode(String.self, forKey: .title),
			count: try container.decode(Int.self, forKey: .count),
			colorString: try container.decode(String.self, forKey: .colorString)
		)
	}
}

// MARK -
private extension Collection {
	enum CodingKeys: String, CodingKey {
		case title
		case count
		case colorString = "color"
	}
}
