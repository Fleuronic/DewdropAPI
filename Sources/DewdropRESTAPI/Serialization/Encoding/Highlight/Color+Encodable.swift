// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Highlight

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension Highlight.Color: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case blue
		case brown
		case cyan
		case gray
		case green
		case indigo
		case orange
		case pink
		case purple
		case red
		case teal
		case yellow
	}
}
