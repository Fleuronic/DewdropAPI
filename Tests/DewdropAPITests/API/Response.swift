// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Data
import protocol Papyrus.Request
import protocol Papyrus.Response

struct Response: Papyrus.Response {
	let body: Data?

	var statusCode: Int? { nil }
	var error: (any Swift.Error)? { nil }
	var request: (any Papyrus.Request)? { nil }
	var headers: [String : String]? { nil }
}
