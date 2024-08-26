// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator

extension Collaborator.Role: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .owner: "owner"
		case .member: "member"
		case .viewer: "viewer"
		}
		
		try container.encode(string)
	}
}
