// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.AccessToken

public struct AccessTokenResponse {
	public let result: Bool
	public let resource: Resource
}

extension AccessTokenResponse: Response {
	public typealias Resource = AccessToken

	public init(from decoder: any Decoder) throws {
		try self.init(
			result: true,
			resource: .init(from: decoder)
		)
	}
}
