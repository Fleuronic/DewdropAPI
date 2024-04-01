// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Filter
import struct DewdropService.FilterCountFields

extension FilterCountFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let filter = try Filter(from: decoder)

		self.init(count: filter.count)
	}
}
