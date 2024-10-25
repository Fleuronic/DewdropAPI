// Copyright © Fleuronic LLC. All rights reserved.

public import enum Dewdrop.ItemType

extension ItemType: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		
		self = switch value {
		case "link": .link
		case "article": .article
		case "image": .image
		case "video": .video
		case "document": .document
		case "audio": .audio
		default: throw DecodingError.dataCorruptedError(in: container, debugDescription: .init())
		}
	}
}
