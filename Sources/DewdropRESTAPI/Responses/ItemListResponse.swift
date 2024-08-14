// Copyright © Fleuronic LLC. All rights reserved.

public struct ItemListResponse<Item: Decodable>: Response {
	public let result: Bool
	public let items: [Item]
}
