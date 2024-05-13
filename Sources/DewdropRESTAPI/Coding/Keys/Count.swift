// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Import

extension Import.Count {
	enum CodingKeys: String, CodingKey {
		case bookmarks
		case folders
		case tags
		case highlights
	}
}
