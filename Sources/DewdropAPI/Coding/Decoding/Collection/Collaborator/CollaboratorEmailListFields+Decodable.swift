// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.CollaboratorEmailListFields

extension CollaboratorEmailListFields: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			emails: try container.decode([String].self, forKey: .emails)
		)
	}
}
