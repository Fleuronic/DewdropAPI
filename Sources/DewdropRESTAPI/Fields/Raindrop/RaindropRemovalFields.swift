// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.RaindropFields
import protocol Catenary.Fields

public struct RaindropRemovalFields: Fields {
	public let count: Int
}

// MARK: -
extension RaindropRemovalFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case count = "modified"
	}
}
