// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Highlight

@AutoEncodable(accessControl: .public)
extension Highlight.Content: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
	}
}
