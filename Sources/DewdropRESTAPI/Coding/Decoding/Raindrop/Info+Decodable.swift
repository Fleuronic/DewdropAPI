// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.Raindrop
public import struct Foundation.URL

@AutoDecodable(accessControl: .public)
extension Raindrop.Info: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case title
		case itemType = "type"
		@DecodedValue(Filled<String>.self) case excerpt
		@DecodedValue(Filled<URL>.self) case coverURL = "cover"
		case media
	}
}
