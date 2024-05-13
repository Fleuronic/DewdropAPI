// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Info

extension Info {
	enum CodingKeys: String, CodingKey {
		case title
		case itemType = "type"
		case excerpt
		case coverURL = "cover"
		case media
	}
}
