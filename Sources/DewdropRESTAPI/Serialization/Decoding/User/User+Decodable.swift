// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct Foundation.URL

extension User: Swift.Decodable {
	public enum CodingKeys: String, CodingKey {
		case name
		case fullName
		case email
		case avatarURL = "avatar"
		case hasProSubscription = "pro"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			fullName: container.decodeIfPresent(for: .fullName) ?? container.decode(for: .name),
			email: container.decode(String.self, forKey: .email).filledValue,
			avatarURL: container.decode(String.self, forKey: .avatarURL).filledValue.flatMap(URL.init(string:)),
			hasProSubscription: container.decodeIfPresent(for: .hasProSubscription)
		)
	}
}

