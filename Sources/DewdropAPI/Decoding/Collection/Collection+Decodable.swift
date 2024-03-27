// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL
import struct Foundation.Date

extension Collection: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.init(
			title: try container.decode(String.self, forKey: .title),
			count: try container.decode(Int.self, forKey: .count),
			coverURL: try container.decode([URL].self, forKey: .coverURL).first,
			colorString: try container.decodeIfPresent(String.self, forKey: .colorString),
			view: try container.decode(View.self, forKey: .view),
			access: try container.decode(Access.self, forKey: .access),
			sortIndex: try container.decode(Int.self, forKey: .sortIndex),
			isPublic: try container.decode(Bool.self, forKey: .isPublic),
			isShared: container.contains(.isShared),
			isExpanded: try container.decode(Bool.self, forKey: .isExpanded),
			creationDate: try container.decode(Date.self, forKey: .creationDate),
			updateDate: try container.decode(Date.self, forKey: .updateDate)
		)
	}
}

// MARK -
private extension Collection {
	enum CodingKeys: String, CodingKey {
		case title
		case count
		case coverURL = "cover"
		case colorString = "color"
		case view
		case access
		case sortIndex = "sort"
		case isPublic = "public"
		case isShared = "collaborators"
		case isExpanded = "expanded"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}
}
