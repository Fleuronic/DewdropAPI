// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator

extension Collaborator.Role: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		
		self = switch value {
		case "owner": .owner
		case "member": .member
		case "viewer": .viewer
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
