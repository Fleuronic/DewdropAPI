// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Info
import struct Foundation.URL

@AutoDecodable(accessControl: .public)
extension Info: Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case itemType = "type"
		@DecodedValue(Filled<String>.self) case excerpt
		@DecodedValue(Filled<URL>.self) case coverURL = "cover"
		case media
	}
}
