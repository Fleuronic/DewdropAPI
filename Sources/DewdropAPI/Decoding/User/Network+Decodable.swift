// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Network

extension Network: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(isEnabled: try container.decode(Bool.self, forKey: .isEnabled))
	}
}

private extension Network {
	enum CodingKeys: String, CodingKey {
		case isEnabled = "enabled"
	}
}
