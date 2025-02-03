// Copyright © Fleuronic LLC. All rights reserved.

import class Foundation.JSONEncoder

public final class DewdropEncoder: JSONEncoder, @unchecked Sendable {
	override init() {
		super.init()

		keyEncodingStrategy = .convertToSnakeCase
	}
}
