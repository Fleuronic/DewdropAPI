// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.ImportFolderCountFields

extension ImportFolderCountFields: Decodable {
	public enum CodingKeys: String, CodingKey {
		case count
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			folderFields: try .init(from: decoder),
			count: try container.decodeIfPresent(for: .count).undocumented
		)
	}
}
