// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CoverFields

extension CoverFields: Swift.Decodable {
	public init(from decoder: Decoder) throws {
		self = .init(cover: try .init(from: decoder))
	}
}
