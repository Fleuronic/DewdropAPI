// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Cache

extension Cache.Status: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		
		self = switch value {
		case "ready": .ready
		case "retry": .retry
		case "failed": .failed
		case "invalid-origin": .invalid(.origin)
		case "invalid-timeout": .invalid(.timeout)
		case "invalid-size": .invalid(.size)
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
