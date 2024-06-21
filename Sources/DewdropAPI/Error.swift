// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import class Foundation.JSONDecoder
import protocol PapyrusCore.Response
import protocol Catena.Fields

public struct Error: Swift.Error, Equatable {
	public let statusCode: Int
	public let message: String
}

// MARK: -
extension Error {
	static func undocumented(
		fieldName: String,
		fields: (some Fields).Type
	) -> Catena.Error<Self> {
		.undocumented(message: """
			The `\(fieldName)` field is undocumented and may have been removed. Please use a DewdropAPI instance without passing `\(fields)`.
			"""
		)
	}
}

// MARK: -
extension Error: Decodable {
	enum CodingKeys: String, CodingKey {
		case statusCode = "status"
		case message = "errorMessage"
	}
}

extension Error: CustomStringConvertible {
	public var description: String {
		"Error \(statusCode): \(message)"
	}
}

// MARK: -
extension Response {
	func apiError(validating: Bool) -> Error? {
		func parseError() -> Error? {
			let decoder = JSONDecoder()
			let error = body.flatMap { try? decoder.decode(Error.self, from: $0) }
			let errorMessage = body.flatMap { String(data: $0, encoding: .utf8) }

			return if let error {
				error
			} else if let statusCode, let errorMessage, validating {
				.init(statusCode: statusCode, message: errorMessage)
			} else {
				nil
			}
		}

		do {
			if validating {
				try validate()
				return nil
			} else {
				return parseError()
			}
		} catch {
			return parseError()
		}
	}
}

