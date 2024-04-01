// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.ConfigFields

extension ConfigFields {
	enum CodingKeys: String, CodingKey {
		case lastViewedCollectionID = "lastCollection"
	}
}
