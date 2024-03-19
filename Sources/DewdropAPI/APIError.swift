// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.APIError

public extension API {
	struct Error: APIError {
		public let success: Bool
		public let statusCode: Int
		public let message: String
	}
}
