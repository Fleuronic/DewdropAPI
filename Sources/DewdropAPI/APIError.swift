// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catena.APIError

public extension API {
	struct Error: APIError {
		public let statusCode: Int
		public let message: String
	}
}

extension API.Error {
	enum CodingKeys: String, CodingKey {
		case statusCode = "status"
		case message = "errorMessage"
	}
}
