// Copyright © Fleuronic LLC. All rights reserved.

public import struct Foundation.URL
public import protocol DewdropService.CreationSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

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
	) async -> Self.Result<RaindropCreationFields> {
		await result {
			try await raindrops.createRaindrop(
				link: url.absoluteString,
				title: title
			).item
		}
	}
}
