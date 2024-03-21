// Copyright © Fleuronic LLC. All rights reserved.

import struct Catenary.DynamicKey
import protocol Catenary.APIResponse

public extension API {
	struct Response {
		private let container: KeyedDecodingContainer<DynamicKey>
	}
}

// MARK -
extension API.Response: APIResponse {
	// MARK: Response
	public func resource<Resource: Decodable>() throws -> Resource {
		fatalError()
	}
	
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		if let error = try? API.Error(from: decoder) { throw error }
		container = try decoder.container(keyedBy: DynamicKey.self)
	}
}
