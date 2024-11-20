// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol Catenary.Fields
import protocol DewdropService.RaindropFields

public struct RaindropHighlightFields: RaindropFields {
	public let id: Raindrop.ID
	public let highlights: [HighlightInRaindropFields]
}

extension RaindropHighlightFields: Fields {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case highlights
	}
}
