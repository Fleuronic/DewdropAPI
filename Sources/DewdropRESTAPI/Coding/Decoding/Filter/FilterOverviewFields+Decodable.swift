// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.FilterOverviewFields

@AutoDecodable(accessControl: .public)
extension FilterOverviewFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case tags
		case typeFilters = "types"
		@Conditional case favorited = "important"
		@Conditional case highlighted = "highlights"
		@Conditional case duplicate = "duplicates"
		@Conditional case untagged = "notag"
		@Conditional case broken
	}
}
