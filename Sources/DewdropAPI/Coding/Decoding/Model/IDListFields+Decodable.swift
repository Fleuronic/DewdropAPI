// Copyright © Fleuronic LLC. All rights reserved.

import struct Identity.Identifier
import struct DewdropService.IDListFields

extension IDListFields: Decodable where Model.ID: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(ids: try container.decode([Model.ID].self, forKey: .ids))
	}
}
