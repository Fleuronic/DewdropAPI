// Copyright © Fleuronic LLC. All rights reserved.

import InitMacro
import URL

import struct Foundation.URL
import protocol Catenary.RESTAPI

@Init public struct API {
	private let apiKey: String
}

// MARK: -
extension API: RESTAPI {
	// MARK: API
	public func url(for path: String) -> URL {
		let url = #URL("https://api.raindrop.io/rest/v1/")
		return url.appendingPathComponent(path)
	}
}
