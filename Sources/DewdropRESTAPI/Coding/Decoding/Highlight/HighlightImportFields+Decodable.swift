// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.HighlightImportFields

extension HighlightImportFields: Swift.Decodable {
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
