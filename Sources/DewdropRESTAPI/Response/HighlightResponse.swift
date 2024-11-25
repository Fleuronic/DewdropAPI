// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Highlight
import protocol DewdropService.HighlightFields
import protocol DewdropService.RaindropFields
import protocol Identity.Identifiable

public typealias HighlightsResponse<Fields: HighlightFields & Decodable> = ItemListResponse<Fields>

// MARK: -
public struct HighlightsInRaindropResponse<Fields: HighlightFields & Decodable> {
	public let result: Bool
	public let item: RaindropHighlightFields<Fields>
}

// MARK: -
extension HighlightsInRaindropResponse: Response {
	public typealias Resource = Highlight
}
