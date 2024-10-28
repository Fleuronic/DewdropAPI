// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollaboratorRoleFields

extension CollaboratorRoleFields: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			role: try container.decode(for: .role)
		)
	}
}
