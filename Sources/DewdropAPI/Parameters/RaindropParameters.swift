// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catena.Parameters

struct RaindropParameters: Parameters {
	let search: String?
	
	init(
		search: String? = nil
	) {
		self.search = search
	}
}

extension RaindropParameters {
	enum CodingKeys: String, CodingKey {
		case search
	}
}
