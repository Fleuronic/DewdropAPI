// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Filter
import protocol DewdropService.FilterFields
import protocol Catenary.Fields

public struct FilterOverviewFields: FilterFields {
	public let tags: [TagDetails]
	public let typeFilters: [FilterDetails]
	public let favorited: Filter?
	public let highlighted: Filter?
	public let duplicate: Filter?
	public let untagged: Filter?
	public let broken: Filter?
}

// MARK: -
extension FilterOverviewFields: Fields {
	// MARK: Decodable
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
