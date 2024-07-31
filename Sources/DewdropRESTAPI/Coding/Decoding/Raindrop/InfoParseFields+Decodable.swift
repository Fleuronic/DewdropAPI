// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.InfoParseFields
import struct DewdropService.TagNameFields

extension InfoParseFields: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case meta
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			meta: container.decode(for: .meta),
			info: .init(from: decoder)
		)
	}
}

@AutoDecodable(accessControl: .public)
extension InfoParseFields.Meta: @retroactive Decodable {
	private enum CodingKeys: String, CodingKey {
		case text
		case tags
	}
}
