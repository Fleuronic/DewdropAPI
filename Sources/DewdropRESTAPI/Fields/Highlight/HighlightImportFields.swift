// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import struct Foundation.Date
import protocol DewdropService.HighlightFields
import protocol Catenary.Fields

@dynamicMemberLookup
public struct HighlightImportFields: HighlightFields {
	public let creationDate: Date

	private let content: Highlight.Content
}

// MARK: -
public extension HighlightImportFields {
	subscript<T>(dynamicMember keyPath: KeyPath<Highlight.Content, T>) -> T {
		content[keyPath: keyPath]
	}
}

// MARK: -
extension HighlightImportFields: Fields {
	// MARK: Decodable
	private enum CodingKeys: String, CodingKey {
		case text
		case color
		case note
		case creationDate = "created"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			creationDate: container.decode(for: .creationDate),
			content: .init(
				text: container.decode(for: .text),
				color: container.decode(for: .color),
				note: container.decode(String.self, forKey: .note).filledValue
			)
		)
	}
}
