// Copyright © Fleuronic LLC. All rights reserved.

import AutoCodable

public import struct Dewdrop.AccessToken

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
extension AccessToken.GrantType: Swift.Encodable {
	private enum CodingKeys: String, CodingKey {
		case authorizationCode = "authorization_code"
		case refreshToken = "refresh_token"
	}
}
