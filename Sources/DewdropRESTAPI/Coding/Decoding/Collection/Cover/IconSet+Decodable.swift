// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Collection
public import struct Foundation.URL

extension Collection.Cover.IconSet: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			png: try container.decodeIfPresent(URL.self, forKey: .png),
			svg: try container.decodeIfPresent(URL.self, forKey: .svg)
		)
	}
}
