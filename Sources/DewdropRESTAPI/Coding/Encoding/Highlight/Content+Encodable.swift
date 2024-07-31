// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight

extension Highlight.Content: @retroactive Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(text, forKey: .text)
		try container.encode(color, forKey: .color)
		try container.encodeIfPresent(note, forKey: .note)
	}
}
