// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct Foundation.URL
import struct Foundation.Date

extension Collection: Decodable {
	private enum CodingKeys: String, CodingKey {
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

	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			title: container.decode(for: .title),
			count: container.decode(for: .count),
			coverURL: container.decode([URL].self, forKey: .coverURL).first,
			colorString: container.decodeIfPresent(for: .colorString),
			view: container.decode(for: .view),
			access: container.decode(for: .access),
			sortIndex: container.decodeIfPresent(for: .sortIndex),
			isPublic: container.decode(for: .isPublic),
			isShared: container.contains(.isShared),
			isExpanded: container.decode(for: .isExpanded),
			creationDate: container.decode(for: .creationDate),
			updateDate: container.decode(for: .updateDate)
		)
	}
}
