// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct DewdropService.InfoParseFields

extension InfoParseFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case meta
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			meta: container.decode(for: .meta),
			info: .init(from: decoder)
		)
	}
}

@AutoDecodable(accessControl: .public)
extension InfoParseFields.Meta: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case tags
	}
}
