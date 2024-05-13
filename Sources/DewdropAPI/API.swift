// Copyright © Fleuronic LLC. All rights reserved.

import class PapyrusCore.Provider
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI

public struct API {
	public let backups: BackupEndpointsAPI
	public let `import`: ImportEndpointsAPI
}

// MARK: -
public extension API {
	init(apiKey: String) {
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
	}
}
