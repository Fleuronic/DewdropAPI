// Copyright © Fleuronic LLC. All rights reserved.

public import struct DewdropService.RaindropSuggestionListFields
public import struct DewdropService.TagNameFields
public import struct Dewdrop.Collection
public import struct Catena.IDFields

extension RaindropSuggestionListFields: Swift.Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(
			collections: try container.decode([IDFields<Collection.Identified>].self, forKey: .collections),
			tags: try container.decode([TagNameFields].self, forKey: .tags)
		)
	}
}
