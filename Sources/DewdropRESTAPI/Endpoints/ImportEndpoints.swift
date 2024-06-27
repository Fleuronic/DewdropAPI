// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus

import struct Foundation.URL

@API @JSON(decoder: .dewdrop)
public protocol ImportEndpoints: Sendable {
	@GET("/import/url/parse")
	func parseURL(urlString url: String) async throws -> InfoResponse
	
	@POST("/import/url/exists")
	func checkURLsExistence(urlStrings urls: [String]) async throws -> RaindropIDListResponse

	@POST("/import/file") @Multipart
	func parseHTMLImportFile(file: Part) async throws -> ImportResponse
}
