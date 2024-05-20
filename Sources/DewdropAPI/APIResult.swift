// Copyright © Fleuronic LLC. All rights reserved.

import enum Catena.Error
import protocol Catena.Fields

public extension API {
	typealias Result<Response> = Swift.Result<Response, Catena.Error<APIError>>
}

// MARK: -
extension API {
	func result<Response>(request: @escaping () async throws -> Response) async -> Result<Response> {
		do {
			return .success(try await request())
		} catch {
			return .failure(.init(error))
		}
	}
	
	func result<Response: Fields, UndocumentedResponse: Fields>(
		undocumentedKeys: PartialKeyPath<UndocumentedResponse>...,
		transform: (UndocumentedResponse) -> Response,
		request: @escaping () async throws -> UndocumentedResponse
	) async -> Result<Response> {
		do {
			return .success(transform(try await request()))
		} catch {
			return .failure(.init(error))
		}
	}
}
