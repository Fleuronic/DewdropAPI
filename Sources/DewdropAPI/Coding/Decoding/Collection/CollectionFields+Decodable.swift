// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionFields

extension CollectionFields: Decodable {
	public init(from decoder: Decoder) throws {
		self = .init(try .init(from: decoder))
	}
}
