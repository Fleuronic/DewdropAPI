// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

import struct Dewdrop.AccessToken
import struct Foundation.Date

@AutoDecodable(accessControl: .public)
extension AccessToken: Decodable {
	private enum CodingKeys: String, CodingKey {
		case accessToken
		case refreshToken
		case expirationDuration = "expiresIn"
		case tokenType
	}
}
