// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Tag
import protocol Catenary.Parameters

struct FilterListParameters: Parameters {
	let search: String?
	let tagSort: Tag.Sort?
	
	init(
		search: String? = nil,
		tagSort: Tag.Sort? = nil
	) {
		self.search = search
		self.tagSort = tagSort
	}
}

extension FilterListParameters {
	enum CodingKeys: String, CodingKey {
		case search
		case tagSort = "tagsSort"
	}
}
