// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropDetailsFields
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
	RaindropListFields: RaindropFields & Decodable,
	RaindropCreationFields: RaindropFields & Decodable,
	CollectionListFields: CollectionFields & Decodable,
	HighlightListFields: HighlightFields & Decodable,
	UserAuthenticatedFields: UserFields & Decodable,
	FileImportFields: ImportFields & Decodable
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
	func returning<Fields: RaindropFields & Decodable>(raindropListFields: Fields.Type) -> API<
		Fields,
		RaindropCreationFields,
		CollectionListFields,
		HighlightListFields,
		UserAuthenticatedFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: RaindropFields & Decodable>(raindropCreationFields: Fields.Type) -> API<
		RaindropListFields,
		Fields,
		CollectionListFields,
		HighlightListFields,
		UserAuthenticatedFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: CollectionFields & Decodable>(collectionListFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		Fields,
		HighlightListFields,
		UserAuthenticatedFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: HighlightFields & Decodable>(highlightListFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		CollectionListFields,
		Fields,
		UserAuthenticatedFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: UserFields & Decodable>(userAuthenticatedFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		CollectionListFields,
		HighlightListFields,
		Fields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: ImportFields & Decodable>(importFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		CollectionListFields,
		HighlightListFields,
		UserAuthenticatedFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetailsFields,
	RaindropDetailsFields,
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
			if let error = response.apiError(validating: true) { throw error }
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
