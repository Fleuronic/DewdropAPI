// Copyright © Fleuronic LLC. All rights reserved.

public struct ItemResponse<Resource: Decodable>: Response {
	public let result: Bool
	public let item: Resource
}
