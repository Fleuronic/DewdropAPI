// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Dewdrop.Raindrop
import struct Dewdrop.Collection

extension User.Config: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			fontSize: try container.decode(Int.self, forKey: .fontSize),
			fontColor: try .init(string: container.decode(String.self, forKey: .fontColor)),
			brokenLevel: try container.decode(BrokenLevel.self, forKey: .brokenLevel),
			languageCode: try container.decodeIfPresent(String.self, forKey: .languageCode),
			defaultRaindropSort: try container.decode(Raindrop.Sort.self, forKey: .defaultRaindropSort),
			defaultCollectionView: try container.decode(Collection.View.self, forKey: .defaultCollectionView)
		)
	}
}

private extension User.Config.FontColor {
	init?(string value: String) {
		switch value {
		case "sunset": self = .sunset
		case "night": self = .night
		default: return nil
		}
	}
}
