// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catenary.Fields
import protocol DewdropService.RaindropFields
import protocol DewdropService.HighlightFields

public struct RaindropHighlightFields<Fields: HighlightFields & Decodable>: RaindropFields {
	public let id: Raindrop.ID
	public let highlights: [Fields]
}

// MARK: -
extension RaindropHighlightFields: Catenary.Fields {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case highlights
	}
}
