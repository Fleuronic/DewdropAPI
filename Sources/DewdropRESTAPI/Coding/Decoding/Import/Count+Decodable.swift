// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import enum Dewdrop.Import

@AutoDecodable(accessControl: .public)
extension Import.Count: Decodable {
	private enum CodingKeys: String, CodingKey {
		case bookmarks
		case folders
		case tags
		case highlights
	}
}
