// Copyright © Fleuronic LLC. All rights reserved.

import class PapyrusCore.Provider
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropService.ImportFolderFields
import protocol DewdropService.ImportFields

public struct API<FileImportFields: ImportFields> {
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
		importFileFields: FileImportFields.Type = ImportFolderFields.self
	) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError { throw error }
			return response
		}

		backups = BackupEndpointsAPI(provider: provider)
		`import` = ImportEndpointsAPI(provider: provider)
		tags = TagEndpointsAPI(provider: provider)
		filters = FilterEndpointsAPI(provider: provider)
		users = UserEndpointsAPI(provider: provider)
	}
}
