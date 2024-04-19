// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Parameters

struct HighlightListParameters: Parameters {
	let page: Int?
	let highlightsPerPage: Int?
}

extension HighlightListParameters {
	enum CodingKeys: String, CodingKey {
		case page
		case highlightsPerPage = "perpage"
	}
}
