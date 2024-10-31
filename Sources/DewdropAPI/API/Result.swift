// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Error
import protocol Catena.Fields
import protocol Catena.UndocumentedFields

import protocol DewdropRESTAPI.Response

extension API {
	func result<T: UndocumentedFields, U: UndocumentedFields>(
		transform: (U) -> T,
		request: @escaping () async throws -> U
	) async -> Self.Response<T> {
		do {
			let response = try await transform(request())
			try response.undocumentedFields.first { $1 }.map { field, _ in
				throw Error.undocumented(
					fieldName: String(describing: field).components(separatedBy: ".").last!,
					fields: T.self
				)
			}
			return .success(response)
		} catch {
			return .failure(.init(error))
		}
	}
}
