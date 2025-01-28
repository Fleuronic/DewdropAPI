// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Collection
import protocol Catenary.Fields

public struct EmptyCollectionRemovalFields {
	public let count: Int
}

extension EmptyCollectionRemovalFields: Fields {
	public typealias Model = Collection
}
