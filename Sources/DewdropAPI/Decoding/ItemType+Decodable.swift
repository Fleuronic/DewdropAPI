// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop

extension Raindrop.ItemType: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)
		
		self = switch value {
		case "link": .link
		case "article": .article
		case "image": .image
		case "video": .video
		case "document": .document
		case "audio": .audio
		default: fatalError()
		}
	}
}
