// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
	}
}
