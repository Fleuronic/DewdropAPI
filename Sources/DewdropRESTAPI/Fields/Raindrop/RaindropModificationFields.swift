// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catenary.Fields

public struct RaindropModificationFields {
	public let count: Int
}

// MARK: -
extension RaindropModificationFields: Fields {
	// MARK: Fields
	public typealias Model = Raindrop

	// MARK: Decodable
	private enum CodingKeys: String, CodingKey {
		case count = "modified"
	}
}
