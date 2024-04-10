// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catenary.Parameters

struct RaindropListParameters: Parameters {
	let sort: Raindrop.Sort?
	let page: Int?
	let raindropsPerPage: Int?
	let search: String?
	
	init(
		sort: Raindrop.Sort?,
		page: Int?,
		raindropsPerPage: Int?,
		search: String?
	) {
		self.sort = sort
		self.page = page
		self.raindropsPerPage = raindropsPerPage
		self.search = search
	}
}

extension RaindropListParameters {
	enum CodingKeys: String, CodingKey {
		case sort
		case page
		case raindropsPerPage = "perpage"
		case search
	}
}
