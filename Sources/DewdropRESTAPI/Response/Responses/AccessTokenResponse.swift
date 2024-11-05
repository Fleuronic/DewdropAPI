// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.AccessToken

public struct AccessTokenResponse {
	public let result: Bool
	public let item: Item
}

extension AccessTokenResponse: Response {
	public typealias Item = AccessToken

	public init(from decoder: any Decoder) throws {
		try self.init(
			result: true,
			item: .init(from: decoder)
		)
	}
}
