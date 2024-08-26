// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Tag

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension Tag.Sort: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case count =  "-count"
		case name = "_id"
	}
}
