// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Payload

struct TagRenamePayload: Payload {
	let tagNames: [String]
	let updatedTagName: String
}

// MARK: -
extension TagRenamePayload {
	enum CodingKeys: String, CodingKey {
		case tagNames = "tags"
		case updatedTagName = "replace"
	}
}
