// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.CollaboratorEmailListFields

extension CollaboratorEmailListFields: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			emails: try container.decode([String].self, forKey: .emails)
		)
	}
}
