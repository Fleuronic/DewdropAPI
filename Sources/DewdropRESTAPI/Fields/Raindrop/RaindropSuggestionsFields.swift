// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import struct Catena.IDFields
import protocol Catenary.Fields

public struct RaindropSuggestionsFields: Fields, Decodable {
	public let collections: [Collection.IDFields]
	public let tags: [TagNameFields]
}
