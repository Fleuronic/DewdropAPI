// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Raindrop
import protocol DewdropService.InfoFields

@dynamicMemberLookup
public struct InfoParseFields: InfoFields {
	public let meta: Meta
	
	private let info: Raindrop.Info
}

// MARK -
public extension InfoParseFields {
	struct Meta: Sendable {
		public let tags: [TagNameFields]
	}

	subscript<T>(dynamicMember keyPath: KeyPath<Raindrop.Info, T>) -> T {
		info[keyPath: keyPath]
	}
}

extension InfoParseFields: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case meta
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			meta: container.decode(for: .meta),
			info: .init(from: decoder)
		)
	}
}

extension InfoParseFields.Meta: Swift.Decodable {
	enum CodingKeys: String, CodingKey {
		case tags
	}
}
