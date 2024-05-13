// Copyright © Fleuronic LLC. All rights reserved.

//import enum Dewdrop.ItemType
//import struct Dewdrop.Raindrop
//import struct Dewdrop.Collection
//import struct Dewdrop.Media
//import struct Dewdrop.Highlight
//import struct Foundation.URL
//import struct Foundation.Date
//import protocol Catena.Payload
//
//struct RaindropPayload {
//	let url: URL
//	let title: String?
//	let itemType: ItemType?
//	let excerpt: String?
//	let coverURL: URL?
//	let order: Int?
//	let collectionID: Collection.ID?
//	let tagNames: [String]?
//	let media: [Media]?
//	let highlightContents: [Highlight.Content]?
//	let isFavorite: Bool?
//	let isBroken: Bool?
//	let creationDate: Date?
//	let updateDate: Date?
//	let shouldParse: Bool
//}
//
//// MARK: -
//extension RaindropPayload: Payload {
//	// MARK: Encodable
//	public func encode(to encoder: Encoder) throws {
//		var container = encoder.container(keyedBy: CodingKeys.self)
//		try container.encode(url, forKey: .url)
//		try container.encodeIfPresent(title, forKey: .title)
//		try container.encodeIfPresent(itemType, forKey: .itemType)
//		try container.encodeIfPresent(excerpt, forKey: .excerpt)
//		try container.encodeIfPresent(coverURL, forKey: .coverURL)
//		try container.encodeIfPresent(order, forKey: .order)
//		try container.encodeIfPresent(collectionID, forKey: .collectionID)
//		try container.encodeIfPresent(tagNames, forKey: .tagNames)
//		try container.encodeIfPresent(media, forKey: .media)
//		try container.encodeIfPresent(highlightContents, forKey: .highlightContents)
//		try container.encodeIfPresent(isFavorite, forKey: .isFavorite)
//		try container.encodeIfPresent(isBroken, forKey: .isBroken)
//		try container.encodeIfPresent(creationDate, forKey: .creationDate)
//		try container.encodeIfPresent(updateDate, forKey: .updateDate)
//		try container.encodeIfPresent(shouldParse ? Parse() : nil, forKey: .shouldParse)	
//	}
//}
//
//// MARK: -
//private extension RaindropPayload {
//	enum CodingKeys: String, CodingKey {
//		case url = "link"
//		case title
//		case itemType = "type"
//		case excerpt
//		case coverURL = "cover"
//		case order
//		case collectionID = "collection"
//		case tagNames = "tags"
//		case media
//		case highlightContents = "highlights"
//		case isFavorite = "important"
//		case isBroken = "broken"
//		case creationDate = "created"
//		case updateDate = "lastUpdate"
//		case shouldParse = "pleaseParse"
//	}
//}
//
//// MARK: -
//private struct Parse: Encodable {}
