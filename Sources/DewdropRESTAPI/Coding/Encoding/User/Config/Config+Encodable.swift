// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User

extension User.Config: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(fontSize, forKey: .fontSize)
		try container.encodeIfPresent(fontColor, forKey: .fontColor)
		try container.encode(brokenLevel, forKey: .brokenLevel)
		try container.encodeIfPresent(languageCode, forKey: .languageCode)
		try container.encode(defaultRaindropSort, forKey: .defaultRaindropSort)
		try container.encode(defaultCollectionView, forKey: .defaultCollectionView)
	}
}
