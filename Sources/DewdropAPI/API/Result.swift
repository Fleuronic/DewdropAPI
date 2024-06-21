// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import protocol Catena.Fields
import protocol Catena.UndocumentedFields
import protocol DewdropRESTAPI.Response

extension API {
	func result<Response: UndocumentedFields, UndocumentedResponse: UndocumentedFields>(
		transform: (UndocumentedResponse) -> Response,
		request: @escaping () async throws -> UndocumentedResponse
	) async -> Self.Result<Response> {
		do {
			let response = try await transform(request())
			try response.undocumentedFields.first { $1 }.map { field, _ in
				throw APIError.undocumented(
					fieldName: String(describing: field).components(separatedBy: ".").last!,
					fields: Response.self
				)
			}
			return .success(response)
		} catch {
			return .failure(.init(error))
		}
	}
}
