// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.HighlightImportFields

extension HighlightImportFields {
	enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
		case creationDate = "created"
	}
}
