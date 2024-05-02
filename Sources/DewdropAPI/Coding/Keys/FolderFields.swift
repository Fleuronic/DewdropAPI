// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.FolderFields

extension FolderFields {
	enum CodingKeys: String, CodingKey {
		case title
		case bookmarks
		case folders	
	}
}
