// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.CollaboratorFields

public struct CollaboratorEmailsFields: CollaboratorFields, Decodable {
	public let emails: [String]
}
