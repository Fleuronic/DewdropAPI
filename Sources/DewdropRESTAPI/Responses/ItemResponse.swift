// Copyright © Fleuronic LLC. All rights reserved.

public struct ItemResponse<Item: Decodable>: Response {
	public let result: Bool
	public let item: Item
}
