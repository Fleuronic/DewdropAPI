// Copyright © Fleuronic LLC. All rights reserved.

public import enum Dewdrop.ItemType

extension ItemType: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
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
