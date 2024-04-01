// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection

extension Collection {
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
