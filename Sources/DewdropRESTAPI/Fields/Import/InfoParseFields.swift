// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import protocol DewdropService.InfoFields
import protocol Catenary.Fields

@dynamicMemberLookup
public struct InfoParseFields: InfoFields {
	public let meta: Meta
	
	private let info: Raindrop.Info
}

// MARK: -
public extension InfoParseFields {
	struct Meta: Decodable, Sendable {
		public let tags: [TagNameFields]
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Raindrop.Info, T>) -> T {
		info[keyPath: keyPath]
	}
}

// MARK: -
extension InfoParseFields: Fields {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			meta: container.decode(for: .meta),
			info: .init(from: decoder)
		)
	}
}

// MARK: -
private extension InfoParseFields {
	enum CodingKeys: String, CodingKey {
		case meta
	}
}

// MARK: -
private extension InfoParseFields.Meta {
	enum CodingKeys: String, CodingKey {
		case tags
	}
}
