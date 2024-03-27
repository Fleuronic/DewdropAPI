// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.CollectionListFields

extension CollectionListFields: Decodable {
	public init(from decoder: Decoder) throws {
		self = .init(try .init(from: decoder))
	}
}
