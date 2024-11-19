// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import enum Catenary.Undocumented
import struct Dewdrop.Filter
import protocol DewdropService.FilterFields

@_UncheckedMemberwiseInit(.public)
public struct FilterOverviewTotalFields {
	public let tags: [TagDetails]
	public let typeFilters: [FilterDetails]
	public let favorited: Filter?
	public let highlighted: Filter?
	public let duplicate: Filter?
	public let untagged: Filter?
	public let broken: Filter?
	
	private let undocumentedTotal: Undocumented<Filter>
}

// MARK: -
public extension FilterOverviewTotalFields {
	var total: Filter {
		undocumentedTotal.precheckedValue
	}
}

// MARK: -
extension FilterOverviewTotalFields: FilterFields {
	// MARK: Fields
	public var undocumentedFields: [PartialKeyPath<Self>: Bool] {
		[
			\.total: undocumentedTotal.isMissing
		]
	}
}

// MARK: -
extension FilterOverviewTotalFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case tags
		case typeFilters = "types"
		case total
		case favorited = "important"
		case highlighted = "highlights"
		case duplicate
		case untagged = "notag"
		case broken
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			tags: container.decode(for: .tags),
			typeFilters: container.decode(for: .typeFilters),
			favorited: container.decodeIfPresent(for: .favorited),
			highlighted: container.decodeIfPresent(for: .highlighted),
			duplicate: container.decodeIfPresent(for: .duplicate),
			untagged: container.decodeIfPresent(for: .untagged),
			broken: container.decodeIfPresent(for: .broken),
			undocumentedTotal: container.decodeIfPresent(for: .total).undocumented
		)
	}
}
