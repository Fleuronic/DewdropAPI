// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import protocol DewdropService.TagFields

public struct TagNameFields: TagFields {
	public let name: String
}

// MARK: -
@AutoDecodable(accessControl: .public, container: .singleValue("name"))
extension TagNameFields: Decodable {}
