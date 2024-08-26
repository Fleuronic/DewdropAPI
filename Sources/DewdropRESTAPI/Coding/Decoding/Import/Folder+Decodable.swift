// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Folder

@AutoDecodable(accessControl: .public)
extension Folder: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
	}
}
