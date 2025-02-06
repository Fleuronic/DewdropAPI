// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Foundation.URL

extension User: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case username = "name"
		case fullName
		case avatarURL = "avatar"
		case hasProSubscription = "pro"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			username: container.decode(for: .username),
			fullName: container.decode(for: .fullName),
			avatarURL: container.decode(String.self, forKey: .avatarURL).filledValue.flatMap(URL.init(string:)),
			hasProSubscription: container.decode(for: .hasProSubscription)
		)
	}
}

