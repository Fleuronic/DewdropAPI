// Copyright © Fleuronic LLC. All rights reserved.

import struct Catena.IDFields
import struct Identity.Identifier
import protocol Catenary.Fields

extension IDFields: Swift.Decodable where Model.ID: Decodable {
	// MARK: Decodable
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	private enum TopLevelCodingKeys: String, CodingKey {
		case id = "$id"
	}

	public init(from decoder: any Decoder) throws {
		do {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			try self.init(id: container.decode(for: .id))
		} catch {
			do {
				let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
				try self.init(id: container.decode(for: .id))
			} catch {
				let container = try decoder.singleValueContainer()
				try self.init(id: container.decode())
			}
		}
	}
}

extension IDFields: Swift.Encodable where Model.ID: Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(id)
	}
}

// MARK: -
extension IDFields: Catenary.Fields where Model.RawIdentifier: Codable {}
