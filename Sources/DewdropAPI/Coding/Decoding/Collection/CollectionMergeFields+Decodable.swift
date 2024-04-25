// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionMergeFields

extension CollectionMergeFields: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			ids: try container.decode([Collection.ID].self, forKey: .ids),
			modifiedCount: try container.decode(Int.self, forKey: .modifiedCount)
		)
	}
}
