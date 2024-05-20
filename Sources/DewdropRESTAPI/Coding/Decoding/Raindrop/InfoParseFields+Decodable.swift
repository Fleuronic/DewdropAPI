// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.InfoParseFields
import struct DewdropService.TagNameFields

extension InfoParseFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case meta
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			meta: try container.decode(for: .meta),
			info: try .init(from: decoder)
		)
	}
}

@AutoDecodable(accessControl: .public)
extension InfoParseFields.Meta: Decodable {
	private enum CodingKeys: String, CodingKey {
		case text
		case tags
	}
}
