// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Error
import protocol Catenary.Fields

extension API {
	func response<Fields: Catenary.Fields>(request: @escaping () async throws -> Fields) async -> Response<Fields> {
		do {
			let fields = try await request()
			if !fields.missingFields.isEmpty {
				throw Error.undocumented(
					fieldNames: fields.missingFields.map(name),
					fields: Fields.self
				)
			}
			return .success(fields)
		} catch {
			return .failure(.init(error))
		}
	}

	func response<Fields: Catenary.Fields>(request: @escaping () async throws -> [Fields]) async -> Response<[Fields]> {
		do {
			let fields = try await request()
			for fields in fields {
				if !fields.missingFields.isEmpty {
					throw Error.undocumented(
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
