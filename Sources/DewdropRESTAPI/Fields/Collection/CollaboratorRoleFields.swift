// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collaborator
import protocol DewdropService.CollaboratorFields

public struct CollaboratorRoleFields: CollaboratorFields, Decodable {
	public let role: Collaborator.Role
}
