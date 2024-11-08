// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Error
import class Foundation.JSONDecoder
import protocol Catenary.Fields
import protocol PapyrusCore.Response

public struct Error: Swift.Error, Equatable {
	public let statusCode: Int
	public let message: String

	private let errorString: String?
}

// MARK: -
public extension Error {
	var error: Any? {
		errorString.map(Int.init) ?? errorString
	}
}

// MARK: -
extension Error {
	static func undocumented(
		fieldNames: [String],
		fields: (some Fields).Type
	) -> Catenary.Error<Self> {
		let list = fieldNames.joined(separator: ", ")
		let phrase = fieldNames.count == 1 ? "field is" : "fields are"
		return .undocumented(message: """
			The `\(list)` \(phrase) undocumented and may have been removed. Returning `\(fields)` is no longer supported.
			"""
		)
	}
}

// MARK: -
extension Error: Decodable {
	private enum CodingKeys: String, CodingKey {
		case error
		case message = "errorMessage"
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		message = try container.decode(for: .message)
		errorString = try container.decode(for: .error)

		statusCode = 200
	}
}

// MARK: -
private extension Error {
	init(
		statusCode: Int,
		message: String
	) {
		self.statusCode = statusCode
		self.message = message

		errorString = nil
	}
}

// MARK: -
extension Response {
	// TODO: Remove parameter?
	func apiError(validating: Bool) -> Error? {
		func parseError() -> Error? {
			let decoder = JSONDecoder()
			let error = body.flatMap { try? decoder.decode(Error.self, from: $0) }
			let message = body.flatMap { String(data: $0, encoding: .utf8) }

			return if let error {
				error
			} else if let statusCode, let message, validating {
				.init(
					statusCode: statusCode,
					message: message
				)
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

