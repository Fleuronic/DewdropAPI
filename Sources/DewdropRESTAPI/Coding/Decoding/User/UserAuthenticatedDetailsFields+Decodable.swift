// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.UserAuthenticatedDetailsFields

extension UserAuthenticatedDetailsFields: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
		case config
		case groups
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		try self.init(
			id: container.decode(for: .id),
			config: container.decode(for: .config),
			groups: container.decode(for: .groups),
			account: .init(from: decoder)
		)
	}
}
