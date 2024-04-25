// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catena.Parameters

struct RaindropListParameters: Parameters {
	let sort: Raindrop.Sort?
	let page: Int?
	let raindropsPerPage: Int?
	let search: String?
}

extension RaindropListParameters {
	enum CodingKeys: String, CodingKey {
		case sort
		case page
		case raindropsPerPage = "perpage"
		case search
	}
}
