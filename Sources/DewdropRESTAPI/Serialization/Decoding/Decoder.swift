// Copyright © Fleuronic LLC. All rights reserved.

import class Foundation.JSONDecoder
import struct Foundation.Date

extension JSONDecoder {
	static var dewdrop: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .custom { decoder in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			return try Date(dateString, strategy: .iso8601
				.year()
				.month()
				.day()
				.time(includingFractionalSeconds: false)
			)
		}

		return decoder
	}
}
