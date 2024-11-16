// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import protocol DewdropService.TagFields

public struct TagNameFields: TagFields {
	public let name: String
}

@AutoDecodable(accessControl: .public, container: .singleValue("name"))
extension TagNameFields: Decodable {}
