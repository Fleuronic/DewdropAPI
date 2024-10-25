// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct DewdropService.TagNameFields

@AutoDecodable(accessControl: .public, container: .singleValue("name"))
extension TagNameFields: Swift.Decodable {}
