// Copyright © Fleuronic LLC. All rights reserved.

import enum DewdropRESTAPI.Error

public extension API {
	typealias Result<Response> = Swift.Result<Response, DewdropRESTAPI.Error<Error>>
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
}

// MARK: -
public extension Result {
	func asyncMap<NewSuccess>(_ transform: (Success) async -> NewSuccess) async -> Result<NewSuccess, Failure> {
		switch self {
		case let .success(value): .success(await transform(value))
		case let .failure(error): .failure(error)
		}
	}

	func asyncFlatMap<NewSuccess>(_ transform: (Success) async -> Result<NewSuccess, Failure>) async -> Result<NewSuccess, Failure> {
		switch self {
		case let .success(value): await transform(value)
		case let .failure(error): .failure(error)
		}
	}
}

public extension Result where Success: OptionalProtocol {
	func map<NewSuccess>(_ transform: (Success.Wrapped) -> NewSuccess) async -> Result<NewSuccess?, Failure> {
		switch self {
		case let .success(value):
			if let wrapped = value.wrapped {
				.success(transform(wrapped) as NewSuccess?)
			} else {
				.success(nil)
			}
		case let .failure(error):
			.failure(error)
		}
	}


	func asyncFlatMap<NewSuccess>(_ transform: (Success.Wrapped) async -> Result<NewSuccess, Failure>) async -> Result<NewSuccess?, Failure> {
		switch self {
		case let .success(value):
			if let wrapped = value.wrapped {
				 await transform(wrapped).map { $0 as NewSuccess? }
			} else {
				.success(nil)
			}
		case let .failure(error): 
			.failure(error)
		}
	}
}

public protocol OptionalProtocol {
	associatedtype Wrapped

	var wrapped: Wrapped? { get }
}

extension Optional: OptionalProtocol {
	public var wrapped: Wrapped? { self }
}

//public extension Optional {
//	func asyncMap<T>(_ transform: (Wrapped) async -> T) async -> T? {
//		if let result = self { await transform(result) } else { nil }
//	}
//
//	func asyncFlatMap<T>(_ transform: (Wrapped) async -> T?) async -> T? {
//		if let result = self { await transform(result) } else { nil }
//	}
//
//	func asyncMapNil(_ defaultValue: () async -> Wrapped) async -> Wrapped {
//		if let result = self { result } else { await defaultValue() }
//	}
//}
