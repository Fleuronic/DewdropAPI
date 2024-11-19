// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.Raindrop
import struct Dewdrop.Media
import struct Foundation.URL
import struct Foundation.Date
import protocol DewdropService.RaindropFields
import protocol Catenary.Fields

public struct RaindropImportFields: RaindropFields {
	public let url: URL
	public let title: String
	public let excerpt: String?
	public let coverURL: URL?
	public let note: String?
	public let media: [Media]
	public let isFavorite: Bool
	public let creationDate: Date
	public let updateDate: Date
	public let tags: [TagNameFields]
	public let highlights: [HighlightImportFields]?
}

// MARK: -
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
