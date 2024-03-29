// Copyright © Fleuronic LLC. All rights reserved.

import URL

import enum Catenary.Request
import struct Foundation.URL
import struct Foundation.Date
import class Foundation.JSONDecoder
import class Foundation.ISO8601DateFormatter
import protocol Catenary.RESTAPI

public struct API {
	private let apiKey: String
	private let dateFormatter: ISO8601DateFormatter

	public init(apiKey: String) {
		self.apiKey = apiKey

		dateFormatter = .init()
		dateFormatter.formatOptions = [.withFractionalSeconds, .withInternetDateTime]
	}
}

// MARK: -
extension API: RESTAPI {
	// MARK: API
	public var decoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .custom { decoder -> Date in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			return dateFormatter.date(from: dateString)!
		}
		
		return decoder
	}

	public var authenticationHeader: Request.Header? {
		.init(
			field: "Authorization",
			value: "Bearer \(apiKey)"
		)
	}
	
	public func url(for path: String) -> URL {
		let url = #URL("https://api.raindrop.io/rest/v1/")
		return url.appendingPathComponent(path)
	}
}
