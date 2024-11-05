// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.RaindropHighlightDetailsFields

@AutoDecodable(accessControl: .public)
extension RaindropHighlightDetailsFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
		case highlights
	}
}
