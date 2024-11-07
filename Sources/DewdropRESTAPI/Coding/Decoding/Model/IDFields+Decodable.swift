// Copyright © Fleuronic LLC. All rights reserved.

import struct Catena.IDFields
import struct Identity.Identifier

extension IDFields: Swift.Decodable where Model.ID: Decodable {
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
			let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
			try self.init(id: container.decode(for: .id))
		}
	}
}
