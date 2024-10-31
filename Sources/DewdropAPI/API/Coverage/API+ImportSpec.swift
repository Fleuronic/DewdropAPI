// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import struct Dewdrop.Raindrop
import struct DewdropService.InfoParseFields
import struct DewdropService.ImportFolderCountFields
import struct Catena.IDListFields
import protocol DewdropService.ImportSpec
import protocol Catena.Scoped
import protocol Catenary.API

extension API: ImportSpec {
	public func parse(url: URL) async -> Response<InfoParseFields> {
		await response {
			try await `import`.parseURL(urlString: url.absoluteString).item
		}
	}

	public func importFile(at url: URL, withName filename: String) async -> Response<FileImportFields> {
		await result(transform: FileImportFields.init) {
			try await `import`.parseHTMLImportFile(
				file: .init(
					data: try .init(contentsOf: url),
					name: "import",
					fileName: filename
				)
			)
		}
	}

	public func checkExistence(of urls: [URL]) async -> Response<IDListFields<Raindrop.Identified>> {
		await response {
			try await `import`.checkURLsExistence(urlStrings: urls.map(\.absoluteString)).ids
		}.map(IDListFields.init)
	}
}
