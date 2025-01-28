// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct DewdropService.IdentifiedCollection
import struct Catena.IDFields
import protocol Catenary.Fields

public struct RaindropSuggestionsFields {
	public let collections: [Collection.IDFields]
	public let tags: [TagNameFields]
}

extension RaindropSuggestionsFields: Fields {
	// MARK: Fields
	public typealias Model = Raindrop
}
