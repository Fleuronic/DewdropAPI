// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.ImportFolderCountFields

extension ImportFolderCountFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case count
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			count: try container.decode(for: .count),
			folderFields: try .init(from: decoder)
		)
	}
}
