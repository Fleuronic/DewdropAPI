// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import enum Dewdrop.ItemType

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension ItemType: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case link
		case article
		case image
		case video
		case document
		case audio
	}
}
