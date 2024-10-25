// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.Highlight

extension Highlight.Color: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let value = try container.decode(String.self)

		self = switch value {
		case "blue": .blue
		case "brown": .brown
		case "cyan": .cyan
		case "gray": .gray
		case "green": .green
		case "indigo": .indigo
		case "orange": .orange
		case "pink": .pink
		case "purple": .purple
		case "red": .red
		case "teal": .teal
		default: .yellow
		}
	}
}
