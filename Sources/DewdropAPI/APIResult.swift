// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import protocol Catena.Fields
import protocol Catena.UndocumentedFields

public extension API {
	typealias Result<Response> = Swift.Result<Response, Catena.Error<APIError>>
}

// MARK: -
extension API {
	func result<Response>(request: @escaping () async throws -> Response) async -> Result<Response> {
		do {
			let response = try await request()
			return .success(response)
		} catch {
			return .failure(.init(error))
		}
	}
	
	func result<Response: UndocumentedFields, UndocumentedResponse: UndocumentedFields>(
		transform: (UndocumentedResponse) -> Response,
		request: @escaping () async throws -> UndocumentedResponse
	) async -> Result<Response> {
		do {
			let response = try await transform(request())
			try response.undocumentedFields.first { $1 }.map { field, _ in
				throw APIError.undocumented(
					fieldName: .init(describing: field).components(separatedBy: ".").last!,
					fields: Response.self
				)
			}
			return .success(response)
		} catch {
			return .failure(.init(error))
		}
	}
}
