// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.ImportFields
import protocol Catenary.Fields

public struct ImportFolderFields: ImportFields {
	public let folders: [FolderContentFields]
}

// MARK: -
extension ImportFolderFields: Fields {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
	}
}
