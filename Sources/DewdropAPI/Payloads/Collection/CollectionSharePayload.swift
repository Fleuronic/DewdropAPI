// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator
import protocol Catenary.Payload

struct CollectionSharePayload: Payload {
	let role: Collaborator.Role
	let emails: [String]
}
