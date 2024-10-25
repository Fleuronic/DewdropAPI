// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.CoverFields

extension CoverFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		self = .init(cover: try .init(from: decoder))
	}
}
