// Copyright © Fleuronic LLC. All rights reserved.

//import struct Dewdrop.Highlight
//import protocol Catena.Payload
//
//struct HighlightListPayload {
//	let ids: [Highlight.ID]
//	let contents: [Highlight.Content]
//}
//
//// MARK: -
//extension HighlightListPayload: Payload {
//	// MARK: Encodable
//	public func encode(to encoder: Encoder) throws {
//		let payloads = zip(ids, contents).map { id, content in
//			HighlightPayload(
//				id: id,
//				text: content.text,
//				color: content.color,
//				note: content.note
//			)
//		}
//
//		var container = encoder.container(keyedBy: CodingKeys.self)
//		try container.encode(payloads, forKey: .highlights)
//	}
//}
//
//// MARK: -
//private extension HighlightListPayload {
//	enum CodingKeys: String, CodingKey {
//		case highlights
//	}
//}
//
//// MARK: -
//private struct HighlightPayload: Payload {
//	let id: Highlight.ID
//	let text: String
//	let color: Highlight.Color
//	let note: String?
//}
//
//// MARK: -
//private extension HighlightPayload {
//	enum CodingKeys: String, CodingKey {
//		case id = "_id"
//		case text
//		case color
//		case note
//	}
//}
