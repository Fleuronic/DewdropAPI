// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Collection

extension Collection.Cover: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			title: try container.decode(for: .title),
			iconSets: try container.decode(for: .iconSets)
		)
	}
}
