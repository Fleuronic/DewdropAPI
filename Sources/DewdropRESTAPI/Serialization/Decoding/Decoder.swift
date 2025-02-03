// Copyright © Fleuronic LLC. All rights reserved.

import class Foundation.JSONDecoder
import struct Foundation.Date

public final class DewdropDecoder: JSONDecoder, @unchecked Sendable {
	override public init() {
		super.init()

		keyDecodingStrategy = .convertFromSnakeCase
		dateDecodingStrategy = .custom { decoder in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			return try .init(dateString, strategy: .iso8601
				.year()
				.month()
				.day()
				.time(includingFractionalSeconds: false)
			)
		}
	}
}
