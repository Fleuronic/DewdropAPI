// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import struct Dewdrop.Raindrop
import struct DewdropRESTAPI.InfoParseFields
import struct DewdropRESTAPI.ImportFolderCountFields
import struct Catena.IDListFields
import protocol DewdropService.ImportSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: ImportSpec {
	#if swift(<6.0)
	public typealias URLInfoFields = InfoParseFields
	public typealias FileImportFields = ImportSpecifiedFields
	#endif

	public func parse(url: URL) async -> SingleResult<InfoParseFields> {
		await result {
			try await importEndpoints.parseURL(urlString: url.absoluteString).item
		}
	}

	public func checkExistence(of urls: [URL]) async -> SingleResult<Raindrop.IDListFields> {
		await result {
			try await importEndpoints.checkURLsExistence(urlStrings: urls.map(\.absoluteString)).ids
		}.map(IDListFields.init)
	}

	public func importFile(at url: URL, withName filename: String) async -> SingleResult<ImportSpecifiedFields> {
		await result {
			try await importEndpoints.parseHTMLImportFile(
				file: .init(
					data: try .init(contentsOf: url),
					name: "import",
					fileName: filename
				)
			)
		}
	}
}
