// Copyright © Fleuronic LLC. All rights reserved.

import class Foundation.JSONDecoder
import class Foundation.ISO8601DateFormatter
import struct Foundation.Date

extension JSONDecoder {
	static var dewdrop: JSONDecoder {
		let dateFormatter = ISO8601DateFormatter()
		dateFormatter.formatOptions = [.withFractionalSeconds, .withInternetDateTime]

		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .custom { decoder -> Date in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			return dateFormatter.date(from: dateString)!
		}

		return decoder
	}
}