// Copyright © Fleuronic LLC. All rights reserved.

import class PapyrusCore.Provider
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropService.ImportFolderFields
import protocol DewdropService.ImportFields
import protocol Catenary.API

public struct API<FileImportFields: ImportFields> {
	let collections: CollectionEndpointsAPI
	let raindrops: RaindropEndpointsAPI
	let backups: BackupEndpointsAPI
	let `import`: ImportEndpointsAPI
	let tags: TagEndpointsAPI
	let filters: FilterEndpointsAPI
	let users: UserEndpointsAPI
}

// MARK: -
public extension API {
	init(
		apiKey: String,
		fileImportFields: FileImportFields.Type = ImportFolderFields.self
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
		users = .init(provider: provider)
	}
}

extension API: Catenary.API {
	public typealias Error = DewdropAPI.Error
}
