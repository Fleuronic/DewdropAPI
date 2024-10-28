// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.ImportFields
import protocol DewdropService.UserFields
import protocol Catenary.API
import class PapyrusCore.Provider

import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI

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
}

// MARK: -
public extension API {
	init(
		apiKey: String
		// TODO: Default fields
	) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError(validating: true) { throw error }
			return response
		}
		
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

extension API: Catenary.API {
	public typealias Error = DewdropAPI.Error
}
