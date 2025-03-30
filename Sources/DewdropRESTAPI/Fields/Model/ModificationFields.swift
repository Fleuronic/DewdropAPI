// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Fields

public struct ModificationFields<Model> {
	public let count: Int
}

// MARK: -
extension ModificationFields: Fields {
	// MARK: Decodable
	private enum CodingKeys: String, CodingKey {
		case count = "modified"
	}
}
