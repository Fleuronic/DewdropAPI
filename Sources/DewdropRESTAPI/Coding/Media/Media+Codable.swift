// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Media

//@AutoDecodable(accessControl: .public)
//@AutoEncodable(accessControl: .public)
extension Media: Codable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
		@Conditional case type
	}
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			url: container.decode(for: .url),
			type: container.decodeIfPresent(for: .type)
		)
	}
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(url, forKey: .url)
		try container.encodeIfPresent(type, forKey: .type)
	}
}
