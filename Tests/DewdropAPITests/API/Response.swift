// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Foundation

struct Response: PapyrusResponse {
	let body: Data?

	var statusCode: Int? { nil }
	var error: (any Swift.Error)? { nil }
	var request: (any PapyrusRequest)? { nil }
	var headers: [String : String]? { nil }
}
