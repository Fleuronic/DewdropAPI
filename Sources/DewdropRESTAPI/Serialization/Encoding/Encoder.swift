// Copyright © Fleuronic LLC. All rights reserved.

import class Foundation.JSONEncoder

extension JSONEncoder {
	static var dewdrop: JSONEncoder {
		let encoder = JSONEncoder()
		encoder.keyEncodingStrategy = .convertToSnakeCase
		return encoder
	}
}
