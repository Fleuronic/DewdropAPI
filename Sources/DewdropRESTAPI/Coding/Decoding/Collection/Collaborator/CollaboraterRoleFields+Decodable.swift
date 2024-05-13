// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator
import struct DewdropService.CollaboratorRoleFields

extension CollaboratorRoleFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			role: try container.decode(Collaborator.Role.self, forKey: .role)
		)
	}
}
