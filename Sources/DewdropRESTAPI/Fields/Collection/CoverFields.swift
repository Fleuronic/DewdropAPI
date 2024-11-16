// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Collection

@dynamicMemberLookup
public struct CoverFields {
	private let cover: Collection.Cover
}

// MARK -
public extension CoverFields {
	subscript<T>(dynamicMember keyPath: KeyPath<Collection.Cover, T>) -> T {
		cover[keyPath: keyPath]
	}
}

// MARK -
extension CoverFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		self = .init(cover: try .init(from: decoder))
	}
}
