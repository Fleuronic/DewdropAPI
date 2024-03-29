// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop

extension Raindrop.Sort.Criterion {
	// MARK: Decodable
	public init?(string value: String) {
		switch value {
		case "title": self = .title
		case "domain": self = .domain
		case "created": self = .creationDate
		default: return nil
		}
	}
}
