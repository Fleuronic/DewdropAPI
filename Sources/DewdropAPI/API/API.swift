// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropDetailsFields
import struct DewdropService.RaindropHighlightDetailsFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.HighlightDetailsFields
import struct DewdropService.UserDetailsFields
import struct DewdropService.ImportFolderFields
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import class PapyrusCore.Provider
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.HighlightFields
import protocol DewdropService.UserFields
import protocol DewdropService.ImportFields
import protocol Catenary.API

public struct API<
	RaindropResponseFields: RaindropFields & Decodable,
	RaindropHighlightResponseFields: RaindropFields & Decodable,
	CollectionResponseFields: CollectionFields & Decodable,
	HighlightResponseFields: HighlightFields & Decodable,
	UserResponseFields: UserFields & Decodable,
	ImportResponseFields: ImportFields & Decodable
>: @unchecked Sendable {
	let collections: CollectionEndpointsAPI
	let raindrops: RaindropEndpointsAPI
	let backups: BackupEndpointsAPI
	let `import`: ImportEndpointsAPI
	let tags: TagEndpointsAPI
	let filters: FilterEndpointsAPI
	let highlights: HighlightEndpointsAPI
	let users: UserEndpointsAPI

	private let provider: Provider
}

// MARK: -
public extension API {
	func raindropResponseFields<Fields: RaindropFields & Decodable>(_: Fields.Type) -> API<
		Fields,
		RaindropHighlightResponseFields,
		CollectionResponseFields,
		HighlightResponseFields,
		UserResponseFields,
		ImportResponseFields
	> { .init(provider: provider) }

	func raindropHighlightResponseFields<Fields: RaindropFields & Decodable>(_: Fields.Type) -> API<
		RaindropResponseFields,
		Fields,
		CollectionResponseFields,
		HighlightResponseFields,
		UserResponseFields,
		ImportResponseFields
	> { .init(provider: provider) }

	func collectionResponseFields<Fields: CollectionFields & Decodable>(_: Fields.Type) -> API<
		RaindropResponseFields,
		RaindropHighlightResponseFields,
		Fields,
		HighlightResponseFields,
		UserResponseFields,
		ImportResponseFields
	> { .init(provider: provider) }

	func highlightResponseFields<Fields: HighlightFields & Decodable>(_: Fields.Type) -> API<
		RaindropResponseFields,
		RaindropHighlightResponseFields,
		CollectionResponseFields,
		Fields,
		UserResponseFields,
		ImportResponseFields
	> { .init(provider: provider) }

	func userResponseFields<Fields: UserFields & Decodable>(_: Fields.Type) -> API<
		RaindropResponseFields,
		RaindropHighlightResponseFields,
		CollectionResponseFields,
		HighlightResponseFields,
		Fields,
		ImportResponseFields
	> { .init(provider: provider) }

	func importResponseFields<Fields: ImportFields & Decodable>(_: Fields.Type) -> API<
		RaindropResponseFields,
		RaindropHighlightResponseFields,
		CollectionResponseFields,
		HighlightResponseFields,
		UserResponseFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetailsFields,
	RaindropHighlightDetailsFields,
	CollectionDetailsFields,
	HighlightDetailsFields,
	UserDetailsFields,
	ImportFolderFields
>{
	init(apiKey: String) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError(validating: false) { throw error }
			return response
		}
		
		self.init(provider: provider)
	}
}

// MARK: -
private extension API {
	init(provider: Provider) {
		self.provider = provider
		
		collections = .init(provider: provider)
		raindrops = .init(provider: provider)
		backups = .init(provider: provider)
		`import` = .init(provider: provider)
		tags = .init(provider: provider)
		filters = .init(provider: provider)
		highlights = .init(provider: provider)
		users = .init(provider: provider)
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias Error = DewdropAPI.Error
}
