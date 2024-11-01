// Copyright © Fleuronic LLC. All rights reserved.

import struct DewdropService.RaindropDetailsFields
import struct DewdropService.CollectionDetailsFields
import struct DewdropService.UserAuthenticatedDetailsFields
import struct DewdropService.ImportFolderFields
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import class PapyrusCore.Provider
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.ImportFields
import protocol DewdropService.UserFields
import protocol Catenary.API

public struct API<
	RaindropListFields: RaindropFields & Decodable,
	RaindropCreationFields: RaindropFields & Decodable,
	CollectionListFields: CollectionFields & Decodable,
	UserDetailsFields: UserFields & Decodable,
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
		UserDetailsFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: RaindropFields & Decodable>(raindropCreationFields: Fields.Type) -> API<
		RaindropListFields,
		Fields,
		CollectionListFields,
		UserDetailsFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: CollectionFields & Decodable>(collectionListFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		Fields,
		UserDetailsFields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: UserFields & Decodable>(userDetailsFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		CollectionListFields,
		Fields,
		FileImportFields
	> { .init(provider: provider) }

	func returning<Fields: ImportFields & Decodable>(importFields: Fields.Type) -> API<
		RaindropListFields,
		RaindropCreationFields,
		CollectionListFields,
		UserDetailsFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetailsFields,
	RaindropDetailsFields,
	CollectionDetailsFields,
	UserAuthenticatedDetailsFields,
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
