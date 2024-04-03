// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Filter
import struct DewdropService.FilterCountFields

extension FilterCountFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.init(count: try container.decode(Int.self, forKey: .count))
	}
}
