// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight

extension Highlight.Color: @retroactive Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let string = switch self {
		case .blue: "blue"
		case .brown: "brown"
		case .cyan: "cyan"
		case .gray: "gray"
		case .green: "green"
		case .indigo: "indigo"
		case .orange: "orange"
		case .pink: "pink"
		case .purple: "purple"
		case .red: "red"
		case .teal: "teal"
		case .yellow: "yellow"
		}
		
		try container.encode(string)
	}
}
