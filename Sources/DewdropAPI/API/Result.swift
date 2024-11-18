// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Error
import protocol Catenary.Fields

extension API {
	func result<Fields: Catenary.Fields>(request: @escaping () async throws -> Fields) async -> SingleResult<Fields> {
		do {
			let fields = try await request()
			if !fields.missingFields.isEmpty {
				throw APIError.undocumented(
					fieldNames: fields.missingFields.map(name),
					fields: Fields.self
				)
			}
			return .success(fields)
		} catch {
			return .failure(.init(error))
		}
	}

	func results<Fields: Catenary.Fields>(request: @escaping () async throws -> [Fields]) async -> Results<Fields> {
		do {
			let fields = try await request()
			for fields in fields {
				if !fields.missingFields.isEmpty {
					throw APIError.undocumented(
						fieldNames: fields.missingFields.map(name),
						fields: Fields.self
					)
				}
			}
			return .success(fields)
		} catch {
			return .failure(.init(error))
		}
	}
}

// MARK: -
private extension API {
	func name(of field: PartialKeyPath<some Fields>) -> String {
		.init(describing: field).components(separatedBy: ".").last!
	}
}
