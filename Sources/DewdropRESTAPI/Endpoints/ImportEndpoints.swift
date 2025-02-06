// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Foundation.URL

@API @Mock @JSON(decoder: DewdropDecoder())
public protocol ImportEndpoints {
	init(provider: Provider)

	@GET("/import/url/parse")
	func parseURL(urlString url: String) async throws -> InfoResponse
	
	@POST("/import/url/exists")
	func checkURLsExistence(urlStrings urls: [String]) async throws -> RaindropIDListResponse

	@POST("/import/file") @Multipart
	func parseHTMLImportFile<Fields>(file: Part) async throws -> ImportResponse<Fields>
}

// MARK: -
public extension ImportEndpointsMock {
	convenience init(provider: Provider) {
		self.init()
	}
}
