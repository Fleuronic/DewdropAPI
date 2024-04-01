// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.HighlightInRaindropFields

extension HighlightInRaindropFields {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
		case text
		case color
		case note
		case creationDate = "created"
	}
}
