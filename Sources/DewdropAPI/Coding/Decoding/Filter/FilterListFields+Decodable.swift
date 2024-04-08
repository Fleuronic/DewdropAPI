// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Filter
import struct DewdropService.FilterFields
import struct DewdropService.FilterListFields
import struct DewdropService.CountFields
import struct DewdropService.TagFields

extension FilterListFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			favorited: try container.decodeIfPresent(CountFields.self, forKey: .favorited),
			duplicate: try container.decodeIfPresent(CountFields.self, forKey: .duplicate),
			untagged: try container.decodeIfPresent(CountFields.self, forKey: .untagged),
			broken: try container.decodeIfPresent(CountFields.self, forKey: .broken),
			tags: try container.decode([TagFields].self, forKey: .tags),
			types: try container.decode([FilterFields].self, forKey: .types)
		)
	}
}
