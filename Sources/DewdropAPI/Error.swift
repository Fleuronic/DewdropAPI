// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Error
import class Foundation.JSONDecoder
import protocol Catenary.Fields
import protocol PapyrusCore.Response

public struct Error: Swift.Error, Equatable {
	public let statusCode: Int
	public let message: String
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
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.statusCode = try container.decodeIfPresent(for: .statusCode) ?? 200
		self.message = try container.decode(for: .message)
	}
}

extension Error: CustomStringConvertible {
	public var description: String {
		"Error \(statusCode): \(message)"
	}
}

// MARK: -
private extension Error {
	enum CodingKeys: String, CodingKey {
		case statusCode = "status"
		case message = "errorMessage"
	}
}

// MARK: -
extension Response {
	// TODO: Remove parameter?
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

