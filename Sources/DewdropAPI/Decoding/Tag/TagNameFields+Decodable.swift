// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.TagNameFields

extension TagNameFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.init(name: try container.decode(String.self))
	}
}
