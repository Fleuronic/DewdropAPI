// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.ImportFolderCountFields

extension ImportFolderCountFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case count
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			folderFields: .init(from: decoder),
			count: container.decodeIfPresent(for: .count).undocumented
		)
	}
}
