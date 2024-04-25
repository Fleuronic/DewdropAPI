// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

import enum Catena.Request
import struct Catena.DynamicKey
import protocol Catena.APIResponse

public extension API {
	struct Response {
		private let decoder: Decoder
	}
}

// MARK -
extension API.Response: APIResponse {
	// MARK: Response
	public func resource<Resource: Decodable>() throws -> Resource {
		if let resource = try? Resource(from: decoder) { return resource }

		let container = try decoder.container(keyedBy: DynamicKey.self)
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
		self.decoder = decoder
	}
}

// MARK -
private extension String {
	static let domain = "api.randrop.io"
}
