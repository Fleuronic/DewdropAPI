// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.ItemType

extension ItemType: @retroactive Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		
		let string = switch self {
		case .link: "link"
		case .article: "article"
		case .image: "image"
		case .video: "video"
		case .document: "document"
		case .audio: "audio"
		}
		
		try container.encode(string)
	}
}
