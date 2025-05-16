// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import enum Catenary.Error
import class Foundation.JSONDecoder
import protocol Catenary.Fields

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
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		message = try container.decode(for: .message)
		errorString = try? container.decode(for: .error)
		statusCode = (try? container.decode(for: .statusCode)) ?? 200
	}
}

extension Error: CustomStringConvertible {
	public var description: String {
		let error = errorString.map { " \($0)" } ?? ""
		return "\(statusCode): \(message)\(error)"
	}
}

// MARK: -
private extension Error {
	private enum CodingKeys: String, CodingKey {
		case error
		case statusCode = "status"
		case message = "errorMessage"
	}

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
public extension PapyrusResponse {
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

