// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

import enum Catenary.Request
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
		for key in container.allKeys {
			if let resource = try? container.decode(Resource.self, forKey: key) {
				return resource
			}
		}
		
		throw Request.Error<API.Error>.network(
			NSError(
				domain: .domain,
				code: NSURLErrorCannotDecodeContentData,
				userInfo: [:]
			)
		)
	}
	
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		if let error = try? API.Error(from: decoder) { throw error }
		container = try decoder.container(keyedBy: DynamicKey.self)
	}
}

// MARK -
private extension String {
	static let domain = "api.randrop.io"
}
