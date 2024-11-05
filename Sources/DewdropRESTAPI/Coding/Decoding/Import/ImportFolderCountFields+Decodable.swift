// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.ImportFolderCountFields

extension ImportFolderCountFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
		case count
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			folders: container.decode(for: .folders),
			count: container.decodeIfPresent(for: .count).undocumented
		)
	}
}
