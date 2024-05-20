// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct DewdropService.TagNameFields

@AutoDecodable(accessControl: .public, container: .singleValue("name"))
extension TagNameFields: Decodable {}
