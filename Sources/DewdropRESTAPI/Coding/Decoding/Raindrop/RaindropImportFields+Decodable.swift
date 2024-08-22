// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Foundation.URL
import struct DewdropService.RaindropImportFields

@AutoDecodable(accessControl: .public)
extension RaindropImportFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		@DecodedValue(Filled<String>.self) case excerpt
		@DecodedValue(Filled<URL>.self) case coverURL = "cover"
		@DecodedValue(Filled<String>.self) case note
		case media
		case isFavorite = "important"
		case creationDate = "created"
		case updateDate = "lastUpdate"
		case tags
		@Conditional case highlights
	}
}
