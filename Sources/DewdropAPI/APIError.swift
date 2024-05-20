// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import class Foundation.JSONDecoder
import protocol PapyrusCore.Response
import protocol Catena.Fields

public struct APIError: Swift.Error {
	public let statusCode: Int
	public let message: String
}

// MARK: -
extension APIError {
	static func undocumented<Fields: Catena.Fields>(
		field: String,
		fields: Fields.Type
	) -> Catena.Error<Self> {
		.undocumented(message: """
			The `\(field)` field is undocumented and may have been removed. Please use a DewdropAPI instance without passing `\(fields)`.
			"""
		)
	}
}

// MARK: -
extension APIError: Decodable {
	enum CodingKeys: String, CodingKey {
		case statusCode = "status"
		case message = "errorMessage"
	}
}

extension APIError: CustomStringConvertible {
	public var description: String {
		"Error \(statusCode): \(message)"
	}
}

// MARK: -
extension Response {
	var apiError: APIError? {
		do {
			try validate()
			return nil
		} catch {
			let decoder = JSONDecoder()
			let error = body.flatMap { try? decoder.decode(APIError.self, from: $0) }
			let errorMessage = body.flatMap { String(data: $0, encoding: .utf8) }

			return if let error {
				error
			} else if let statusCode, let errorMessage {
				.init(statusCode: statusCode, message: errorMessage)
			} else {
				nil
			}
		}
	}
}

