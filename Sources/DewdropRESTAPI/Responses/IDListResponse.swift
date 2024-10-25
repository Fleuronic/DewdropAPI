// Copyright © Fleuronic LLC. All rights reserved.

public import protocol Identity.Identifiable

public struct IDListResponse<IdentifiableItem: Identifiable> where IdentifiableItem.ID: Decodable {
	public let result: Bool
	public let ids: [IdentifiableItem.ID]
}

extension IDListResponse: Response {	
	public typealias Item = IdentifiableItem.ID
	
	public var items: [IdentifiableItem.ID] { ids }
}
