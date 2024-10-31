// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import protocol DewdropService.CreationSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: CreationSpec {
	public func createRaindrop(
		url: URL,
		title: String?
	//	itemType: ItemType?,
	//	excerpt: String?,
	//	coverURL: URL?,
	//	order: Int?,
	//	collectionID: Collection.ID?,
	//	tagNames: [String]?,
	//	media: [Media]?,
	//	highlightContents: [Highlight.Content]?,
	//	isFavorite: Bool?,
	//	isBroken: Bool?,
	//	creationDate: Date?,
	//	updateDate: Date?,
	//	shouldParse: Bool
	) async -> Response<RaindropCreationFields> {
		await result {
			try await raindrops.createRaindrop(
				link: url.absoluteString,
				title: title
			).item
		}
	}
}
