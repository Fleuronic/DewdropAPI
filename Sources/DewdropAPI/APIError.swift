// Copyright © Fleuronic LLC. All rights reserved.

import enum DewdropRESTAPI.Error
import class Foundation.JSONDecoder
import protocol PapyrusCore.Response

public extension API {
	struct Error: Swift.Error {
		public let statusCode: Int
		public let message: String
	}
}

// MARK: -
extension API.Error: Decodable {
	enum CodingKeys: String, CodingKey {
		case statusCode = "status"
		case message = "errorMessage"
	}
}

extension API.Error: CustomStringConvertible {
	public var description: String { message }
}

// MARK: -
extension Response {
	var apiError: API.Error? {
		do {
			try validate()
			return nil
		} catch {
			let decoder = JSONDecoder()
			let error = body.flatMap { try? decoder.decode(API.Error.self, from: $0) }
			let errorMessage = body.flatMap { String(data: $0, encoding: .utf8) }

			return if let statusCode, let errorMessage {
				.init(statusCode: statusCode, message: errorMessage)
			} else if let error {
				error
			} else {
				nil
			}
		}
	}
}

