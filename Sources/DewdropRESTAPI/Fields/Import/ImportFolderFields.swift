// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.ImportFields

public struct ImportFolderFields: ImportFields {
	public let folders: [FolderDetails]
}

// MARK: -
extension ImportFolderFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
	}
}
