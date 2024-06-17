// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import protocol DewdropRESTAPI.Response

public extension Authentication.API {
	typealias Result<Response> = Swift.Result<Response, Catena.Error<APIError>>
}

// MARK: -
extension Authentication.API {
	func result<Response>(request: @escaping () async throws -> Response) async -> Result<Response> {
		do {
			let response = try await request()
			return .success(response)
		} catch {
			return .failure(.init(error))
		}
	}
}
