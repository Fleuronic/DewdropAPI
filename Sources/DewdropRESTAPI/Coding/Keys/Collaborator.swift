// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator

extension Collaborator {
	enum CodingKeys: String, CodingKey {
		case email
		case fullName
		case role
	}
}
