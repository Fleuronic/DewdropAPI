// Copyright © Fleuronic LLC. All rights reserved.

public struct ItemListResponse<Resource: Decodable>: Response {
	public let result: Bool
	public let items: [Resource]
}
