// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Filter
import protocol DewdropService.FilterFields

public struct FilterOverviewFields: FilterFields {
	public let tags: [TagCountFields]
	public let typeFilters: [FilterCountFields]
	public let favorited: Filter?
	public let highlighted: Filter?
	public let duplicate: Filter?
	public let untagged: Filter?
	public let broken: Filter?
}

extension FilterOverviewFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case tags
		case typeFilters = "types"
		case favorited = "important"
		case highlighted = "highlights"
		case duplicate
		case untagged = "notag"
		case broken
	}
}
