// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator
import protocol Catenary.Payload

struct CollaboratorUpdatePayload: Payload {
	let role: Collaborator.Role
}
