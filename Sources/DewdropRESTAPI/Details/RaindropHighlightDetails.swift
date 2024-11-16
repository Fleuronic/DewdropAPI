// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol DewdropService.RaindropFields

public struct RaindropHighlightDetails: RaindropFields {
	public let id: Raindrop.ID
	public let highlights: [HighlightInRaindropDetails]
}

extension RaindropHighlightDetails: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case highlights
	}
}
