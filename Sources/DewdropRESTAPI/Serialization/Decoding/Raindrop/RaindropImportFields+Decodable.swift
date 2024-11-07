// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.RaindropImportFields
import struct Foundation.URL

@AutoDecodable(accessControl: .public)
extension RaindropImportFields: Swift.Decodable {
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
